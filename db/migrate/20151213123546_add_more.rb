class AddMore < ActiveRecord::Migration
  def change
  	add_column :shops, :city, :string
  	add_column :shops, :state, :string
  	add_column :shops, :country, :string
  	add_column :shops, :zip, :string
  	add_column :shops, :facebook, :string
  	add_column :shops, :linkedin, :string
  	add_column :shops, :google, :string
  	add_column :shops, :twitter, :string
  end
end
