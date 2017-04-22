class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :get_shop
  before_filter :set_current_account
  
  def after_sign_in_path_for(resource)
   
    if business_user_signed_in?
  	 business_user_shops_path
    elsif admin_signed_in?
      admin_shops_path
    elsif site_user_signed_in?
     user_dashboard_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)    
    case resource_or_scope    
      when :business_user, BusinessUser
        new_business_user_session_path
      when :admin, Admin
        new_admin_session_path
      when :site_user, SiteUser
        root_path
      else
        super
    end

  end
  def failure
    case resource_or_scope   
      when :site_user, SiteUser
        root_path
      else
        super
    end
  end  

    def can_administer?      
      business_user_signed_in?
    end
protected

  def layout_by_resource  
    if devise_controller? && resource_name == :site_user
      
      "#{@shop.template}"
    else
      "application"
    end
  end
  def get_shop    
    subdomain = request.subdomain.split(".").last   
    if subdomain.blank? || subdomain =='www'        
      if subdomain.nil?
        @shop = Shop.find_by_domain(request.host) 
      else
        @shop = Shop.find_by_domain(request.domain) 
      end    
      
    else
      @shop = Shop.find_by_subdomain(subdomain) 
    end
  end
  def set_current_account
    #  set @current_account from session data here
    SiteUser.current_shop = @shop
  end
end
