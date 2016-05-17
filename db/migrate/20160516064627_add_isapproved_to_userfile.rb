class AddIsapprovedToUserfile < ActiveRecord::Migration
  def change
    add_column :userfiles, :isapproved, :integer
  end
end
