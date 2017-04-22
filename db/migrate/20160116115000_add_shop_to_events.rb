class AddShopToEvents < ActiveRecord::Migration
  def change
    add_reference :events, :shop, index: true, foreign_key: true
  end
end
