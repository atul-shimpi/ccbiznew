class AdminMailer < ApplicationMailer
  def shopcreation_admin_notification_email(shop)
    @shop = shop
    mail(:to => "sidslakhani@gmail.com, root.pankaj@gmail.com", subject: "New Business Website Created - #{shop.name}")
    #mail(:to => "vishal@veblogy.com, chetan.thakkar07@gmail.com", subject: "New Business Website Created - #{shop.name}")
  end
end
