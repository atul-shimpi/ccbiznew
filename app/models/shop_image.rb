class ShopImage < ActiveRecord::Base
	mount_uploader :image, AvatarUploader
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	crop_uploaded :image

	belongs_to :shop



  
	
end
