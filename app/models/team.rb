class Team < ActiveRecord::Base
  belongs_to :auction

  has_many :teamowners, :dependent => :delete_all
  has_many :players
  accepts_nested_attributes_for :teamowners
end
