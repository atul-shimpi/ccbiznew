class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :layout_by_resource
  before_action :get_shop

  def after_sign_in_path_for(resource)
   
    if business_user_signed_in?
  	 business_user_shops_path
    elsif admin_signed_in?
      admin_shops_path
    elsif site_user_signed_in?
     userdashboard_path
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
      @shop = Shop.find_by_domain(request.host) 
    else
      @shop = Shop.find_by_subdomain(subdomain) 
    end
  end
  
end
