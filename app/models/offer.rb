class Offer < ActiveRecord::Base
	mount_uploader :image, AvatarUploader
	belongs_to :shop

	scope :latest, -> { where(:status => "latest") }
	scope :featured, -> { where(:status => "featured") }
end
