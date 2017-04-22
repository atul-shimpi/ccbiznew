class AddPagealiasToSeodetails < ActiveRecord::Migration
  def change
    add_column :seodetails, :pagealias, :string
  end
end
