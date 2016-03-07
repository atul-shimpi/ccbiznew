class ShopImage < ActiveRecord::Base
	mount_uploader :image, AvatarUploader
	
	crop_uploaded :image

	belongs_to :shop
	def self.crop(current_image, crop_x, crop_y, crop_w, crop_h)
		binding.pry 
		@img = Magick::Image.read(current_image.image_url)
		binding.pry
    	@img.crop!(crop_x, crop_y, crop_w, crop_h)
	end
end
