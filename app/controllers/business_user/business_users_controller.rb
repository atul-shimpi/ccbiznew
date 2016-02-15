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
  def search
    if params[:searchkey]
      @singleshops = SingleBusinessUser.search(params[:searchkey])
    else
      @singleshops = SingleBusinessUser
    end
    render template: "business_user/search/show"
    
  end
  def userdetails
    if params[:id]
      @userdetails = SingleBusinessUser.find(params[:id])
      render template: "business_user/search/single"
    end
  end
 private

  def user_params
    params.require(:business_user).permit(:email, :first_name, :last_name, :phone, :avatar)
  end
end
