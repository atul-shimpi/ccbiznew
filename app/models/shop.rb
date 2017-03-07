class Shop < ActiveRecord::Base
  after_create :admin_notification_init

  after_create :business_user_domain_info
  validates :name, presence: true
  validates :subdomain, uniqueness: {message: "Please choose another subdomain" }
  validates :latitude, :longitude, presence: {message: "Not a valid location, please check name address & country fields" }

  reverse_geocoded_by :latitude, :longitude do |obj,results|         
   if geo = results.first                    
      obj.address = geo.formatted_address
      obj.zip = geo.postal_code
      obj.city = geo.city
      obj.state = geo.state
      obj.country = geo.country      
    end
  end
  after_validation :reverse_geocode

	mount_uploader :avatar, AvatarUploader
  mount_uploader :backgroundimage, AvatarUploader
	belongs_to :business_user
	belongs_to :admin
	belongs_to :category
	has_many :offers, :dependent => :destroy
  has_one :auction, :dependent => :destroy
	has_many :shop_images, :dependent => :destroy
  has_many :seodetails, :dependent =>:destroy
	has_many :events, :dependent => :destroy
  has_many :site_users, :dependent => :destroy
  has_many :fields, class_name: "SiteUserField"
  accepts_nested_attributes_for :fields, allow_destroy: true

	DESIGN_TEMPLATE = { "template_1" => "theme_1", "template_2" => "theme_2", "template_3" => "theme_3", "template_4" => "theme_4", "mandir" => "mandir"}

  SPORTS_TEMPLATE = ['sports_1', 'sports_2'].freeze
  EDUCATION_TEMPLATE = ['education_1', 'education_2', 'education_3'].freeze
  
  ENTERTAINTEMENT_TEMPLATE = ['entertainment_1', 'entertainment_2'].freeze
  SOCIAL_TEMPLATE = ['social_1'].freeze
  POPULARCHAKRAS_TEMPLATE = [].freeze
  CARPOOLING_TEMPLATE = [].freeze
  EVENTSANDPARTIES_TEMPLATE = [].freeze
  BUSINESS_TEMPLATE = [].freeze
  RELIGIOUNANDCOMMUNITY_TEMPLATE = ['mandir'].freeze
  CAREERS_TEMPLATE = [].freeze
  OTHERS_TEMPLATE = ['template_1', 'template_2', 'template_3', 'template_4'].freeze

  def full_address
    [:address, :city, :state, :zip, :country].compact.join(', ')
  end

  def layout_template(type)    
    return eval("#{type}")
  end

  protected

  def admin_notification_init
    # send notification to admin, once shop is created        
    if !self.admin
      AdminMailer.shopcreation_admin_notification_email(self).deliver_now 
    end 
  end

  def business_user_domain_info
    # send information to business user if his own domain        
    if !self.admin      
      if !self.domain.blank?
        BusinessUserMailer.business_user_domain_info_email(self).deliver_now 
      end
    end
  end
end