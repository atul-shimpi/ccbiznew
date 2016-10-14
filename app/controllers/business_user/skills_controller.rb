class BusinessUser::SkillsController < BusinessUser::BaseController
  before_action :get_auction
	def index    
    @skills = @auction.skills.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skills }
    end
  end

  def show
    @skill = Skill.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @skill }
    end
  end

  def new
    @skill = @auction.skills.new    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @skill }
    end
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def create
    @skill = @auction.skills.new(skill_params)
    
    respond_to do |format|
      if @skill.save
        format.html { redirect_to business_user_skills_path(:auction_id => @auction.id), notice: 'Skill was successfully created.' }
        format.json { render json: @skill, status: :created, location: @skill }
      else
        format.html { render action: "new" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @skill = Skill.find(params[:id])
    respond_to do |format|
      if @skill.update_attributes(skill_params)
        format.html { redirect_to business_user_skills_path(:auction_id => @auction.id), notice: 'Business website was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    
    @skill = Skill.find(params[:id])

    @skill.destroy

    respond_to do |format|
      format.html { redirect_to business_user_skills_path(:auction_id => @auction.id) }
      format.json { head :no_content }
    end
  end

  private
  def get_auction    
    @auction = Auction.find(params[:auction_id])
  end
  def skill_params
    params.require(:skill).permit(:name, :image, :auction_id)
  end
end
