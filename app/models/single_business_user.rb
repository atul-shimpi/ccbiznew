class SingleBusinessUser < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
  def name
    "#{self.first_name} #{self.middle_name} #{self.last_name}".titleize
  end
  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("first_name like ? OR skills like ?", "%#{query}%", "%#{query}%") 
  end
end
