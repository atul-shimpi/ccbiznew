class SiteUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  #attr_accessible :fields_attributes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :shop
  has_many :userfiles, :dependent => :destroy
  
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
  def validate_properties
    shop.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must not be blank"
      end
    end
  end
  	
end
