class PlayerSkill < ActiveRecord::Base
  belongs_to :skill
  belongs_to :player
end
