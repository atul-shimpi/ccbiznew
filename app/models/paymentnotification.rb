class Paymentnotification < ActiveRecord::Base
  belongs_to :payment
  belongs_to :site_user
  after_create  :send_notification

  def send_notification
    # send information to business user if his own domain        
    
    BusinessUserMailer.send_notification_to_siteuser(self).deliver_now 
    
  end
end
