class Seodetail < ActiveRecord::Base
  belongs_to :shop

  validates :pagename, uniqueness: { scope: [:shop_id], message: "SEO details for this page already created" }
end
