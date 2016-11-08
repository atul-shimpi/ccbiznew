class SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    self.resource = warden.authenticate(auth_options)

    if self.resource

      #set_flash_message(:notice, :signed_in) if is_flashing_format?
      sign_in(resource_name, resource)
      flash[:notice] = "Login Successful"
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      flash[:error] = "Incorrect email or password"
      redirect_to request.referrer || root_path
      # Authentication fails, redirect the user to the root page     
    end
    
  end

end