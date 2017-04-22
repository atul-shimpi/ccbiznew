class Admin::ShopImagesController < Admin::BaseController
before_action :get_shop
  def index
    @shop_images = @shop.shop_images.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_images }
    end
  end

  def show
    @shop_image = Shop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop }
    end
  end

  def new
    @shop_image = @shop.shop_images.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop_image }
    end
  end

  def edit
    @shop_image = Shop.find(params[:id])
  end

  def create
    @shop_image = @shop.shop_images.new(shop_image_params)

    respond_to do |format|
      if @shop_image.save
        format.html { 
          @shop_image.image.recreate_versions!  
          redirect_to admin_shop_images_path(:shop_id => @shop.id), notice: 'Business website was successfully created.' }
        format.json { render json: @shop_image, status: :created, location: @shop_image }
      else
        format.html { render action: "new" }
        format.json { render json: @shop_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @shop_image = @shop.shop_image.find(params[:id])

    respond_to do |format|
      if @shop.update_attributes(shop_params)
        format.html { redirect_to admin_shops_path, notice: 'Business website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shop_image = ShopImage.find(params[:id])
    @shop_image.destroy

    respond_to do |format|
      format.html { redirect_to admin_shop_images_path(:shop_id => @shop.id) }
      format.json { head :no_content }
    end
  end


  private

  def shop_image_params
    params.require(:shop_image).permit(:shop_id, :shop_image_id, :image_cache,  :image, :crop_x, :crop_y, :crop_w, :crop_h,:imagetype)
  end

  def get_shop
  	@shop = Shop.find(params[:shop_id])
  end

end
