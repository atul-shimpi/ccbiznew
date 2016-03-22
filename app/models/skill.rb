class Skill < ActiveRecord::Base
  has_and_belongs_to_many :auction

	has_many :playerskills, class_name: PlayerSkill 
  has_many :players, :through => :playerskills  
end
