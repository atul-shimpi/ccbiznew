class BusinessUser::PaymentsController < BusinessUser::BaseController
  before_filter :authenticate_business_user!
  

  def index
    
  	@shops_ids = current_business_user.shops.all.map{ |shop|  [shop.id]  }    
    @shop_usersids = SiteUser.where(shop_id:@shops_ids).all.map{ |siteuser|
      [siteuser.id]
    } 
    if !params[:search].nil?
      @payments = Payment.where("site_user_id":@shop_usersids)
      if !params[:search][:status].empty?        
        @payments = @payments.where("status= ?",  params[:search][:status])
      end
      if !params[:search][:fromdate].empty? and !params[:search][:todate].empty?        
        @payments = @payments.where("date(created_at) BETWEEN ? AND ?", params[:search][:fromdate], params[:search][:todate])
      end
    else
      @payments = Payment.where("site_user_id":@shop_usersids)
    end
  	
    
  end 
  def update
    
    @payment = Payment.find(params[:paymentnotification][:payment_id])         
    @payment.status = params[:payment_status]
    @payment.save
    @paymentnotification = Paymentnotification.new(paymentnotification_params)

    respond_to do |format|
      if @paymentnotification.save
        format.html { redirect_to "/business_user/payments", notice: 'Offer was successfully created.' }
        format.json { render json: @paymentnotification, status: :created, location: @paymentnotification }
      else

        format.html { redirect_to "/business_user/payments", notice: 'Error saving data please try again' }
        format.json { render json: @paymentnotification.errors, status: :unprocessable_entity }
      end
    end
  end
  def getdetails
    @payment = Payment.find(params[:paymentid])
    @paymentnotification = Paymentnotification.new
  end
  def paymentnotification_params
    params.require(:paymentnotification).permit(:payment_id, :description)
  end
end

