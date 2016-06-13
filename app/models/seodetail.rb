class Seodetail < ActiveRecord::Base
  belongs_to :shop

  validates :pagename, uniqueness: { scope: [:shop_id], message: "Deetails for this page already created" }
end
