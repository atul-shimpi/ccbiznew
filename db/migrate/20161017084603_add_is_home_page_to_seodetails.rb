class AddIsHomePageToSeodetails < ActiveRecord::Migration
  def change
  	add_column :seodetails, :ishomepage, :integer
  	add_column :seodetails, :isinmenu, :integer
  end
end
