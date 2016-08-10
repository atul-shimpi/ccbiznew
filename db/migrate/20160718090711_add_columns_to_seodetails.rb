class AddColumnsToSeodetails < ActiveRecord::Migration
  def change
    add_column :seodetails, :pagecontent, :text
    add_column :seodetails, :parentpage, :integer
  end
end
