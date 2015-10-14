class Shop < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	belongs_to :user
	has_many :offers
end
