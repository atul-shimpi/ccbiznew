class BusinessUser::BusinessUsersController < BusinessUser::BaseController

  def edit
    @user = current_business_user
  end

  def show
    @shops = current_business_user.shops.limit(5)
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

  def templatelist
    if params[:catid]
      @cat = Category.find(params[:catid])
      @tempcat =  @cat.name.delete(' ').delete('&').delete("'").upcase+"_TEMPLATE"
      @templatearr = Shop.layout_template(@tempcat)
      respond_to do |format|
        format.html { render template: "business_user/shared/templatelist", layout: false}
      end
    end
  end

 private

  def user_params
    params.require(:business_user).permit(:email, :first_name, :last_name, :phone, :avatar)
  end
end
