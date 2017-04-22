class Seodetail < ActiveRecord::Base
  belongs_to :shop

  validates :pagename, uniqueness: { scope: [:shop_id], message: "Page name is already created" }
  validates :slug, uniqueness: { scope: [:shop_id], message: "Please user different slug" }

  before_validation :generate_slug 
  
  def generate_slug 
  	self.slug = pagename.parameterize 
  end
end
