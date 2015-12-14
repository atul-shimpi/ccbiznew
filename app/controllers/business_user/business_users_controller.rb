class BusinessUser::BusinessUsersController < BusinessUser::BaseController

  def edit
    @user = current_business_user
  end

  def update
    @user = current_business_user

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to :back, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


 private

  def user_params
    params.require(:business_user).permit(:email, :first_name, :last_name, :phone)
  end
end
