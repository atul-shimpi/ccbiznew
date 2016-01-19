class Admin::SingleBusinessUsersController <  Admin::BaseController

	def new
		@singlebusinessuser = SingleBusinessUser.new    
    	respond_to do |format|
      	format.html # new.html.erb
      	format.json { render json: @user }
    end
	end

	def index
		@users = SingleBusinessUser.all
	end

	def show
	end
	def edit
	    @singlebusinessuser = SingleBusinessUser.find(params[:id])
	end
	def destroy
	    @singlebusinessuser = SingleBusinessUser.find(params[:id])
	    @singlebusinessuser.destroy

	    respond_to do |format|
	      format.html { redirect_to admin_single_business_users_path }
	      format.json { head :no_content }
	    end
	  end
	def create    
	    @user = SingleBusinessUser.new(user_params)

	    respond_to do |format|
	      if @user.save
	        format.html { redirect_to admin_single_business_users_path, notice: 'User was successfully created.' }
	        format.json { render json: @user, status: :created, location: @user }
	      else
	        format.html { render action: "new" }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end
	def user_params
	    params.require(:single_business_user).permit(:name, :phone, :votingid, :adharid, :skills, :address, :city, :state, :country, :zip, :pannumber)
	end
end
