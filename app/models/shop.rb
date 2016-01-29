class Shop < ActiveRecord::Base
  after_create :admin_notification_init
	reverse_geocoded_by :latitude, :longitude do |obj,results|

  if geo = results.first
    obj.city    = geo.city
    obj.zip = geo.postal_code
    obj.country = geo.country_code
  end
end
after_validation :reverse_geocode
	geocoded_by :address   # can also be an IP address
	before_validation :geocode          # auto-fetch coordinates
	mount_uploader :avatar, AvatarUploader
	belongs_to :business_user
	belongs_to :admin
	belongs_to :category
	has_many :offers
	has_many :shop_images
	has_many :events

	DESIGN_TEMPLATE = { "template_1" => "theme_1", "template_2" => "theme_2", "template_3" => "theme_3", "template_4" => "theme_4", "mandir" => "mandir"}

  protected
  def admin_notification_init

    # send notification to admin, once shop is created
    AdminMailer.delay.shopcreation_admin_notification_email(self)
  end
end
