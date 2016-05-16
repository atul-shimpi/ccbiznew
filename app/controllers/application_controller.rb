class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
    else
      super
  end

  end



end
