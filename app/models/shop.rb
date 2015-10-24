class Shop < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	belongs_to :business_user
	has_many :offers
end
