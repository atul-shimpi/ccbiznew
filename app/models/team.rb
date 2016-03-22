class Team < ActiveRecord::Base
  belongs_to :auction

  has_many :teamowners
  has_many :players
  accepts_nested_attributes_for :teamowners
end
