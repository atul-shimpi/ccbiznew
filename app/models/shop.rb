class Shop < ActiveRecord::Base
  after_create :admin_notification_init
  validates :name, presence: true
  validates :subdomain, uniqueness: {message: "Please choose another subdomain" }
	# reverse_geocoded_by :latitude, :longitude do |obj,results|    
 #    if geo = results.first        
 #      if obj.city == geo.city && obj.zip == geo.postal_code && obj.country == geo.country

 #      else  
 #        obj.latitude = nil    
 #      end
 #    else  
 #      obj.latitude  = nil    
 #    end
 #  end
# validates :latitude, presence: {message: "Not a valid location, please check name address & country fields" }
geocoded_by :address
#geocoded_by :full_address
before_validation :geocode
before_validation :reverse_geocode


#def full_address
#  [:address, :zip, :city, :state, :country].compact.join(', ')
#end

#after_validation :reverse_geocode
	#geocoded_by :address   # can also be an IP address
	#before_validation :geocode          # auto-fetch coordinates
	mount_uploader :avatar, AvatarUploader
	belongs_to :business_user
	belongs_to :admin
	belongs_to :category
	has_many :offers
	has_many :shop_images
	has_many :events

	DESIGN_TEMPLATE = { "template_1" => "theme_1", "template_2" => "theme_2", "template_3" => "theme_3", "template_4" => "theme_4", "mandir" => "mandir"}
  
  protected
  def admin_notification_init

    # send notification to admin, once shop is created
    AdminMailer.shopcreation_admin_notification_email(self)
  end
end
