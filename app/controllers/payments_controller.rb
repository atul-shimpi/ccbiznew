class PaymentsController < ApplicationController
  before_filter :authenticate_site_user!

  def create    
    
    @payment = Payment.new(payment_params)
    @payment.customer_name = current_site_user.email
    @subscription = Subscription.find(params[:payment][:subscription_id])
    @payment.amount = @subscription.price
    @payment.site_user_id = current_site_user.id
    respond_to do |format|
      if @payment.save
        format.html { redirect_to( user_dashboard_path , notice: "Payment recorded successfully")} 
      else
        format.html { redirect_to(user_updatepayment_path, notice: "Please Try Once Again")} 
      end
    end 
  end

  def index
    @payments = Payment.all
  end 
  def payment_params
      params.require(:payment).permit(:payment_transaction_token, :subscription_id, :description)
  end
end

