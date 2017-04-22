class AddmoreColumnsToSeodetails < ActiveRecord::Migration
  def change
    add_column :seodetails, :headerbg, :text
    add_column :seodetails, :footerbg, :text
  end
end
