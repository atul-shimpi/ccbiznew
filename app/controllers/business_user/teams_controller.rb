class BusinessUser::TeamsController < ApplicationController
	before_action :get_auction
	def new
    @team = Team.new    
    @teamowners = @team.teamowners.build
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end
  def edit
    @team = Team.find(params[:id])
    @teamowners = @team.teamowners.build
  end
  def create
    @team = @auction.teams.new(team_params)
    
    respond_to do |format|
      if @team.save
        format.html { redirect_to business_user_auction_path(@auction), notice: 'Team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @team = Team.find(params[:id])    
    respond_to do |format|
      if @team.update_attributes(team_params)
        format.html { redirect_to business_user_auction_path(@auction), notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to business_user_auction_path(@auction) }
      format.json { head :no_content }
    end
  end

	private
  
  def get_auction    
  	@auction = Auction.find(params[:auction_id])
  end
  def team_params
    params.require(:team).permit(:name, :points, :auction_id, teamowners_attributes:[:id, :name, :description, :photo])
  end
end
