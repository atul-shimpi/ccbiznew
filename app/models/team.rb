class Team < ActiveRecord::Base
  belongs_to :auction

  has_many :teamowners, :dependent => :destroy
  has_many :players, :dependent => :destroy
  accepts_nested_attributes_for :teamowners, reject_if: proc { |attributes| attributes['name'].blank? }
end
