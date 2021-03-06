class SiteUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #attr_accessible :fields_attributes
  cattr_accessor :current_shop
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :shop
  has_many :userfiles, :dependent => :destroy
  has_and_belongs_to_many :subscriptions, :dependent => :delete_all

  belongs_to :subscription  
  has_many :payments, :dependent => :delete_all

  validates :email, presence: true
  validates :email, uniqueness: { scope: [:shop_id], message: "This user is already registered" }
  validate :validate_properties
  serialize :properties, Hash
  def email_required?
	  false
  end
  def email_changed?
	  false
  end

  def self.find_for_database_authentication(warden_conditions)    
    
    conditions = warden_conditions.dup
    where(conditions.to_hash).where(["shop_id="+current_shop.id.to_s]).first
  end

  def validate_properties
    shop.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must not be blank"
      end
    end
  end
  	
end
