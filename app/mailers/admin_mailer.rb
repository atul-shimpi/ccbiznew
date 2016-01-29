class AdminMailer < ApplicationMailer
  def shopcreation_admin_notification_email(shop)
    @shop = shop
    mail(:to => "Root.hardik@gmail.com, Root.pankaj@gmail.com", subject: "New Shop Created - #{shop.name}")
  end
end
