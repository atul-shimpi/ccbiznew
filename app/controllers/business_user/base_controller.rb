class BusinessUser::BaseController < ApplicationController
	before_action :authenticate_business_user!


  def after_sign_in_path_for(resource)
  	 business_users_shops_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_business_user_session_path
  end

end
