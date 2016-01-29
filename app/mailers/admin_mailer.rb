class AdminMailer < ApplicationMailer
  def shopcreation_admin_notification_email(shop)
    @shop = shop
    mail(:to => "vishal@veblogy.com", subject: "New Shop Created - #{shop.name}")
  end
end
