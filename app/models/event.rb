class Event < ActiveRecord::Base
	mount_uploader :photo, AvatarUploader
	belongs_to :shop
end
