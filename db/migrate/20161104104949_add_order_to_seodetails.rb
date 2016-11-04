class AddOrderToSeodetails < ActiveRecord::Migration
  def change
    add_column :seodetails, :pageorder, :integer
  end
end
