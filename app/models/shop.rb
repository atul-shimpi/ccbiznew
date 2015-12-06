class Shop < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	geocoded_by :address
	after_validation :geocode, :if => :address_changed?
	belongs_to :business_user
	belongs_to :admin
	belongs_to :category
	has_many :offers
	has_many :shop_images

	DESIGN_TEMPLATE = { "template_1" => "theme_1", "template_2" => "theme_2", "template_3" => "theme_3", "template_4" => "theme_4" }
end
