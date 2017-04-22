class Userfile < ActiveRecord::Base
  belongs_to :siteuser
  mount_uploader :filename, FilesUploader
end
