class Team < ActiveRecord::Base
  belongs_to :auction

  has_many :teamowners, :dependent => :delete_all
  has_many :players, :dependent => :delete_all
  accepts_nested_attributes_for :teamowners, reject_if: proc { |attributes| attributes['name'].blank? }
end
