class BusinessUser::ReceiptsController < ApplicationController
  before_filter :authenticate_business_user!, except: [ :public_show ]

  def show
    @payment = Payment.find(params[:id])
    render :pdf => 'receipt' 
  end 

  ## Shows a receipt using a public access token to display a receipt without authentication
  def public_show
    @payment = Payment.public_fetch params[:payment_id], :public_token => params[:public_token]
    render :pdf => 'receipt', :template => '/business_user/receipts/show.pdf.erb'
  end 

end 


