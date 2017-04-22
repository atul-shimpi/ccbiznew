class BusinessUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
# Setup accessible (or protected) attributes for your model
   has_many :shops
   has_many :subscriptions
   mount_uploader :avatar, AvatarUploader

  def full_name
    "#{self.first_name} #{self.last_name}".titleize
  end
end
