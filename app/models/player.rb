class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :auction
  mount_uploader :image, AvatarUploader
  has_many :playerskills, class_name: PlayerSkill, :dependent => :destroy
  has_many :skills, :through => :playerskills, :dependent => :destroy
  accepts_nested_attributes_for :playerskills, reject_if: proc { |attributes| attributes['skill_id'].blank? }, :allow_destroy => true
  scope :not_in_team, -> { where(:team_id => nil) }
end
