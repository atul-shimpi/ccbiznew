class BusinessUser::OffersController < BusinessUser::BaseController

	 def index
    @shops_ids = current_business_user.shops.all.map{ |shop|
      [shop.id]
    }
    @offers = Offer.where(shop_id:@shops_ids)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers }
    end
  end

  def show
    @offer = Offer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop }
    end
  end

  def new
    @offer = Offer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @offer }
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def create
    @offer = Offer.new(offer_params)

    respond_to do |format|
      if @offer.save
        format.html { redirect_to business_user_offers_path, notice: 'Offer was successfully created.' }
        format.json { render json: @offer, status: :created, location: @offer }
      else
        format.html { render action: "new" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @offer.update_attributes(offer_params)
        format.html { redirect_to business_user_offers_path, notice: 'Business website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to business_user_offers_path }
      format.json { head :no_content }
    end
  end


   private

  def offer_params
    params.require(:offer).permit(:name, :description, :start_date, :end_date, :status, :brand, :product, :discount, :shop_id, :image)
  end
end
