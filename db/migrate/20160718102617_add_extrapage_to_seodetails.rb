class AddExtrapageToSeodetails < ActiveRecord::Migration
  def change
    add_column :seodetails, :extrapage, :boolean
  end
end
