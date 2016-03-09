class AddPageNameToSeodetails < ActiveRecord::Migration
  def change
    add_column :seodetails, :pagename, :text
  end
end
