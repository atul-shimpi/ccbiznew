class Shop < ActiveRecord::Base
  after_create :admin_notification_init

  after_create :business_user_domain_info
  validates :name, presence: true
  validates :subdomain, uniqueness: {message: "Please choose another subdomain" }


	#reverse_geocoded_by :latitude, :longitude do |obj,results|         
   # if geo = results.first              
      #binding.pry
   #   if obj.city.downcase == geo.city.downcase && obj.zip.downcase == geo.postal_code.downcase && obj.country.downcase == geo.country.downcase
   #    obj.latitude = geo.latitude    
   #   else  
   #    obj.latitude = nil    
    #  end
   # else  
   #   obj.latitude  = nil    
   # end
  #end
validates :latitude, presence: {message: "Not a valid location, please check name address & country fields" }
#geocoded_by :address
#before_validation :geocode, :if => :address_changed?
#geocoded_by :full_address
#before_validation :geocode
#before_validation :reverse_geocode


def full_address
  [:address, :city, :state, :zip, :country].compact.join(', ')
end

#after_validation :reverse_geocode
	#geocoded_by :address   # can also be an IP address
	#before_validation :geocode          # auto-fetch coordinates
	mount_uploader :avatar, AvatarUploader
  mount_uploader :backgroundimage, AvatarUploader
	belongs_to :business_user
	belongs_to :admin
	belongs_to :category
	has_many :offers
	has_many :shop_images
  has_many :seodetails
	has_many :events

	DESIGN_TEMPLATE = { "template_1" => "theme_1", "template_2" => "theme_2", "template_3" => "theme_3", "template_4" => "theme_4", "mandir" => "mandir"}
  
  protected
  def admin_notification_init
    # send notification to admin, once shop is created    
    AdminMailer.shopcreation_admin_notification_email(self).deliver_now 
  end
  def business_user_domain_info
    # send information to business user if his own domain    
    BusinessUserMailer.business_user_domain_info_email(self).deliver_now 
  end
end
