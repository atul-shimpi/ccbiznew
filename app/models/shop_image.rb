class ShopImage < ActiveRecord::Base
	mount_uploader :image, AvatarUploader
	
	crop_uploaded :image
	belongs_to :shop

end
