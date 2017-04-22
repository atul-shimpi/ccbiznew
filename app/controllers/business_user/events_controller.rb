class BusinessUser::EventsController < BusinessUser::BaseController

  def index
    @shops_ids = current_business_user.shops.all.map{ |shop|
      [shop.id]
    }
    
    @events = Event.where(shop_id:@shops_ids)
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

    def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
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

 def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(event_params)
        format.html { redirect_to business_user_events_path, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to business_user_events_path }
      format.json { head :no_content }
    end
  end



  def event_params
    params.require(:event).permit(:name, :discription, :event_date, :photo, :venue, :shop_id)
  end
end
