class BusinessUser::FilesController < BusinessUser::BaseController
	before_action :get_site_user
	def index		
    @userfiles = @site_user.userfiles.all    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_images }
    end
  end
  def destroy
    @userfile = Userfile.find(params[:id])
    @userfile.destroy

    respond_to do |format|
      format.html { redirect_to business_user_files_path(:site_user_id => @site_user.id) }
      format.json { head :no_content }
    end
  end
  def approve
  	@userfile = Userfile.find(params[:id])
  	@userfile.isapproved = 1;
    respond_to do |format|
      if @userfile.save
        format.html { redirect_to business_user_files_path(:site_user_id => @site_user.id), notice: 'Business website was successfully updated.' }
        format.json { head :no_content }      
      end
    end
  end
	private

  def get_site_user    
  	@site_user = SiteUser.find(params[:site_user_id])
  end
end
