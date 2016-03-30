class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :auction
  mount_uploader :image, AvatarUploader
  has_many :playerskills, class_name: PlayerSkill 
  has_many :skills, :through => :playerskills  
  accepts_nested_attributes_for :playerskills, reject_if: proc { |attributes| attributes['skill_id'].blank? }
  scope :not_in_team, -> (auction_id){ where(:team_id => nil, :auction_id => auction_id) }
end
