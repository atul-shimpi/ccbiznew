class Fixcolumnsinglebusinessuser < ActiveRecord::Migration
  def change
  	rename_column :single_business_users, :name, :first_name
  end  
end
