class CreatePlayerSkills < ActiveRecord::Migration
  def change
    create_table :player_skills do |t|      
      t.belongs_to :skill, index: true
      t.belongs_to :player, index: true
      t.integer :rating
      t.timestamps null: false
    end
  end
end
