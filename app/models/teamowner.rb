class Teamowner < ActiveRecord::Base
  belongs_to :team

  mount_uploader :photo, AvatarUploader
end
