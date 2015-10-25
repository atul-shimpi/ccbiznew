class AddTemplateToShops < ActiveRecord::Migration
  def change
  	add_column :shops, :template, :string
  end
end
