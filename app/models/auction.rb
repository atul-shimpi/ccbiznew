class Auction < ActiveRecord::Base
  belongs_to :shop
  has_and_belongs_to_many :skill, :dependent => :delete_all
  has_many :teams, :dependent => :delete_all
  has_many :players, :dependent => :delete_all
  has_many :skills, :dependent => :delete_all
  is_impressionable
  validates :shop_id, uniqueness: { message: "One Business Website can have only one Auction" }
end
