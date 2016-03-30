class Skill < ActiveRecord::Base
  belongs_to :auction

  has_many :playerskills, class_name: PlayerSkill 
  mount_uploader :image, AvatarUploader
  has_many :players, :through => :playerskills  
end
