class BusinessUser::PlayersController < ApplicationController
  before_action :get_auction
	def index    
    @players = @auction.players
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @players }
    end
  end

  def show
    @player = Player.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @player }
    end
  end

  def new
    @player = Player.new    
    @skills = @auction.skill.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @player }
    end
  end

  def edit    
    @player = Player.find(params[:id])
    @skills = @auction.skill.all        
    @teams = @auction.teams.where("points > "+@player.baseprice.to_s)
  end
  def playeredit
    @player = Player.find(params[:id])
    @skills = @auction.skill.all        
    
    
    @skills = @auction.skill.all    
    @teams = @auction.teams.where("points > "+@player.baseprice.to_s)
  end
  def create    
    @player = @auction.players.new(player_params)        
    respond_to do |format|
      if @player.save
        format.html { redirect_to business_user_players_path(:auction_id => @auction.id), notice: 'player was successfully created.' }
        format.json { render json: @player, status: :created, location: @player }
      else
        format.html { render action: "new" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @player = Player.find(params[:id])         
    respond_to do |format|
      if @player.update_attributes(player_params)
        format.html { redirect_to business_user_players_path(:auction_id => @auction.id), notice: 'player was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @player.errors, status: :unprocessable_entity }
      end
    end
  end

  def teamupdate
    @player = Player.find(params[:id])       
    @team = Team.find(player_params[:team_id])     
    respond_to do |format|
      if @player.baseprice < player_params[:auctionprice].to_f
        if @team.points > player_params[:auctionprice].to_f
          if @player.update_attributes(player_params)
            @newprice =  @team.points - player_params[:auctionprice].to_f
            @team.update_attribute(:points, @newprice)            
            format.html { redirect_to business_user_players_path(:auction_id => @auction.id), notice: 'Player successfully assigned.' }
            format.json { head :no_content }
          else
            format.html { render action: "edit" }
            format.json { render json: @player.errors, status: :unprocessable_entity }
          end
        else                
          flash[:alert] = 'Team does not have sufficient balance.' 
          format.html { render action: "edit", notice: 'Team does not have sufficient balance.' }
          format.json { render json: @player.errors, status: :unprocessable_entity, notice: 'Team does not have sufficient balance.' }
        end
      else
        flash[:alert] = 'Auction price should be greater than base price.' 
        format.html { render action: "edit", notice: 'Team does not have sufficient balance.' }
        format.json { render json: @player.errors, status: :unprocessable_entity, notice: 'Team does not have sufficient balance.' }
      end      
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    respond_to do |format|
      format.html { redirect_to business_user_players_path(:auction_id => @auction.id), alert: 'Player deleted.' }
      format.json { head :no_content }
    end
  end

  private
  def get_auction    
    @auction = Auction.find(params[:auction_id])
  end
  def player_params
    params.require(:player).permit(:name, :age, :baseprice, :auctionprice, :image, :description, :is_captain, :team_id, playerskills_attributes:[:id, :skill_id, :rating, :_destroy])
  end
end
