class BusinessUserMailer < ApplicationMailer
  def contactus_shopowner_notification_email(contact, shop)
    @contact = contact
    @shop = shop
    mail(:to =>@shop.business_user.email , subject: "New Contact Inquiry - #{shop.name}")
  end
  def business_user_domain_info_email(shop)
  	@shop = shop  	
  	mail(:to =>@shop.business_user.email , subject: "Domain Setup instructions - #{shop.name}")
  end
  def business_user_reciept_email(paymentid) 
  	
  	@payment = Payment.find(paymentid)
  	
    attachments["reciept_#{@payment.id}.pdf"] = WickedPdf.new.pdf_from_string(render_to_string(template: '/business_user/receipts/mail.pdf.erb')) 	

  	mail(:to => @payment.site_user.email, subject: "Payment Reciept") do |format|
      format.html # renders send_report.text.erb for body of email    
    end
  end
  def send_notification_to_siteuser(notification)
    @notifcation = notification
    @payment = Payment.find(notification.payment_id)
    

    mail(:to => @payment.site_user.email, subject: "Notification")
  end
end
