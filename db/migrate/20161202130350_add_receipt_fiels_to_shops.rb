class AddReceiptFielsToShops < ActiveRecord::Migration
  def change
    add_column :shops, :recieptheaderhtml, :text
    add_column :shops, :recieptfooterhtml, :text
  end
end
