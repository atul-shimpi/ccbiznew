class AddPageSlugToSeodetails < ActiveRecord::Migration
  def change
    add_column :seodetails, :slug, :string
  end
end
