class AddShopToContacts < ActiveRecord::Migration
  def change
    add_reference :contacts, :shop, index: true, foreign_key: true
  end
end
