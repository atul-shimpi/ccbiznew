class AddMoreAttributesToPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :image, :string
  	add_column :players, :description, :text
  	add_column :players, :is_captain, :boolean
  end
end
