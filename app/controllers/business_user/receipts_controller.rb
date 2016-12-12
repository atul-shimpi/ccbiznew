class BusinessUser::ReceiptsController < ApplicationController
  before_filter :authenticate_business_user!, except: [ :public_show ]

  def show
    @payment = Payment.find(params[:id])
    
    @shop = @payment.site_user.shop
      if !@shop.recieptheaderhtml.nil? and !@shop.recieptheaderhtml.blank?
        if !@shop.recieptheaderhtml["pages"].nil? and !@shop.recieptheaderhtml["pages"].blank?
          @header_blocks = JSON.parse(@shop.recieptheaderhtml)["pages"]["index"]["blocks"]   
        end
      end
      if !@shop.recieptfooterhtml.nil? and !@shop.recieptfooterhtml.blank?
        if !@shop.recieptfooterhtml["pages"].nil? and !@shop.recieptfooterhtml["pages"].blank?
          @footer_blocks = JSON.parse(@shop.recieptfooterhtml)["pages"]["index"]["blocks"]
        end
      end
      
    render :pdf => 'receipt' 
  end 

  ## Shows a receipt using a public access token to display a receipt without authentication
  def public_show

    @payment = Payment.public_fetch params[:payment_id], :public_token => params[:public_token]
    @shop = @payment.site_user.shop
    if !@shop.recieptheaderhtml.nil? and !@shop.recieptheaderhtml.blank?
        if !@shop.recieptheaderhtml["pages"].nil? and !@shop.recieptheaderhtml["pages"].blank?
          @header_blocks = JSON.parse(@shop.recieptheaderhtml)["pages"]["index"]["blocks"]   
        end
      end
      if !@shop.recieptfooterhtml.nil? and !@shop.recieptfooterhtml.blank?
        if !@shop.recieptfooterhtml["pages"].nil? and !@shop.recieptfooterhtml["pages"].blank?
          @footer_blocks = JSON.parse(@shop.recieptfooterhtml)["pages"]["index"]["blocks"]
        end
      end
    render :pdf => 'receipt', :template => '/business_user/receipts/show.pdf.erb'
  end 
  def sendmail    
    BusinessUserMailer.business_user_reciept_email(params[:id]).deliver_now 
    respond_to do |format|
      format.html { redirect_to business_user_payments_path, notice: 'Mail sent successfully.' }
    end
    
  end
end 


