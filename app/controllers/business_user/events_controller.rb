class BusinessUser::EventsController < BusinessUser::BaseController

  def index
    @events = Event.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end
  def new
    @event = Event.new    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end
  def edit
    @event = Event.find(params[:id])
  end
  def create    
    @event = Event.new(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to business_user_events_path, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  def event_params
    params.require(:event).permit(:name, :discription, :event_date, :photo, :venue, :shop_id)
  end
end
