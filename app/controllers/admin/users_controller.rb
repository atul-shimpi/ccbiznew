class Admin::UsersController < ApplicationController
  before_action :check_user_rights
  def index
    @adminsuser = Admin.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @adminsuser }
    end
  end
  def show
    @adminsuser = Admin.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @adminsuser }
    end
    
  end
  def new
    @adminsuser = Admin.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @adminsuser }
    end
  end

  def create
    @adminsuser = Admin.new(adminsuser_params)

    respond_to do |format|
      if @adminsuser.save
        format.html { redirect_to admin_user_path(@adminsuser), notice: 'Admin user was successfully created.' }
        format.json { render json: @adminsuser, status: :created, location: @adminsuser }
      else
        format.html { render action: "new" }
        format.json { render json: @adminsuser.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @adminsuser = Admin.find(params[:id])
  end
  def update    
    @adminsuser = Admin.find(params[:id])

    respond_to do |format|
      if @adminsuser.update_attributes(adminsuser_params)
        format.html { redirect_to admin_users_path, notice: 'Admin user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @adminsuser.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user = Admin.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path }
      format.json { head :no_content }
    end
  end
  private

  def adminsuser_params
    params.require(:admin).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
  end
  def check_user_rights    
    if !current_admin.issuperadmin?
      redirect_to admin_shops_path
    end
  end
end
