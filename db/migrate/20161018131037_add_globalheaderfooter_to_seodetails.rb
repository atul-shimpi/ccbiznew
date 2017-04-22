class AddGlobalheaderfooterToSeodetails < ActiveRecord::Migration
  def change
    add_column :seodetails, :isglobalheader, :integer
    add_column :seodetails, :isglobalfooter, :integer
  end
end
