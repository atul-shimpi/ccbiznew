class Admin::BusinessUsersController < ApplicationController
  before_action :check_user_rights
	def index
    @businessuser = BusinessUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @businessuser }
    end
  end
  def show
    @businessuser = BusinessUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @businessuser }
    end
    
  end
  def new
    @businessuser = BusinessUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @businessuser }
    end
  end

  def create
    @businessuser = BusinessUser.new(businessuser_params)

    respond_to do |format|
      if @businessuser.save
        format.html { redirect_to admin_business_user_path(@businessuser), notice: 'Business User was successfully created.' }
        format.json { render json: @businessuser, status: :created, location: @businessuser }
      else
        format.html { render action: "new" }
        format.json { render json: @businessuser.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @businessuser = BusinessUser.find(params[:id])
  end
  def update    
    @businessuser = BusinessUser.find(params[:id])

    respond_to do |format|
      if @businessuser.update_attributes(businessuser_params)
        format.html { redirect_to admin_business_users_path, notice: 'Business User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @businessuser.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user = BusinessUser.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_business_users_path }
      format.json { head :no_content }
    end
  end
  private

  def businessuser_params
    params.require(:business_user).permit(:first_name, :last_name, :email, :phone, :password)
  end
  def check_user_rights    
    if !current_admin.issuperadmin?
      redirect_to admin_shops_path
    end
  end
end
