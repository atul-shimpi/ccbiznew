class BusinessUserMailer < ApplicationMailer
  def contactus_shopowner_notification_email(contact, shop)
    @contact = contact
    @shop = shop
    mail(:to =>@shop.business_user.email , subject: "New Contact Inquiry - #{shop.name}")
  end
end
