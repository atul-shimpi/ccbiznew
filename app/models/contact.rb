class Contact < ActiveRecord::Base
	belongs_to :shop
	after_create :contactus_shopowner_notification_init

	protected
	def contactus_shopowner_notification_init
	    # send notification to shopowner, once contact is created
	    @shop = Shop.find(self.shop_id)
		BusinessUserMailer.delay.contactus_shopowner_notification_email(self, @shop)
	end
end
