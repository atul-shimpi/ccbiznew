class Shop < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	belongs_to :business_user
	belongs_to :category
	has_many :offers
	has_many :shop_images
end
