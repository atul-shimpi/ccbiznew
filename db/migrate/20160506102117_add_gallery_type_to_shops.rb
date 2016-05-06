class AddGalleryTypeToShops < ActiveRecord::Migration
  def change
    add_column :shops, :gallerytype, :integer
  end
end
