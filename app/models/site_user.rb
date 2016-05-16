class SiteUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :shop
  has_many :userfiles, :dependent => :destroy
  validates :email, presence: true
  validates :email, uniqueness: { scope: [:shop_id], message: "This user is already registered" }
end
