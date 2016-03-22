class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :auction

  has_many :playerskills, class_name: PlayerSkill 
  has_many :skills, :through => :playerskills  
  accepts_nested_attributes_for :playerskills, reject_if: proc { |attributes| attributes['skill_id'].blank? }
end
