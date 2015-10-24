class Offer < ActiveRecord::Base
	mount_uploader :image, AvatarUploader
	belongs_to :shop
end
