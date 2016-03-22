class BusinessUser::AuctionsController < ApplicationController
	def index
    @shops_ids = current_business_user.shops.all.map{ |shop|
      [shop.id]
    }
    @auctions = Auction.where(shop_id:@shops_ids)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @auctions }
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @teams = Team.where("auction_id="+params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop }
    end
  end

  def new
    @auction = Auction.new    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @auction }
    end
  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def create
    @auction = Auction.new(auction_params)

    respond_to do |format|
      if @auction.save
        format.html { redirect_to business_user_auctions_path, notice: 'Auction was successfully created.' }
        format.json { render json: @auction, status: :created, location: @auction }
      else
        format.html { render action: "new" }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @auction = Auction.find(params[:id])

    respond_to do |format|
      if @auction.update_attributes(auction_params)
        format.html { redirect_to business_user_auctions_path, notice: 'Business website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @auction = Auction.find(params[:id])
    @auction.destroy

    respond_to do |format|
      format.html { redirect_to business_user_auctions_path }
      format.json { head :no_content }
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:name, :shop_id, skill_ids:[])
  end
end
