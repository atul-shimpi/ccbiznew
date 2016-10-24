class Seodetail < ActiveRecord::Base
  belongs_to :shop

  validates :pagename, uniqueness: { scope: [:shop_id], message: "Details for this page already created" }
  validates :slug, uniqueness: { message: "Please user different slug" }
end
