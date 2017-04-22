class Auction < ActiveRecord::Base
  belongs_to :shop
  has_and_belongs_to_many :skill, :dependent => :destroy
  has_many :teams, :dependent => :destroy
  has_many :players, :dependent => :destroy
  has_many :skills, :dependent => :destroy
  is_impressionable
  validates :shop_id, uniqueness: { message: "One Business Website can have only one Auction" }
end
