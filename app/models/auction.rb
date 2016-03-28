class Auction < ActiveRecord::Base
  belongs_to :shop
  has_and_belongs_to_many :skill
  has_many :teams
  has_many :players
  is_impressionable
  validates :shop_id, uniqueness: { message: "One Business Website can have only one Auction" }
end
