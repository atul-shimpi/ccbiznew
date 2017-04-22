class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps null: false
    end
  Category.create(:name => "Sports")
  Category.create(:name => "Education")
  Category.create(:name => "Entertaintement")
  Category.create(:name => "Social")
  Category.create(:name => "Popular Chakra's")
  Category.create(:name => "Car Pooling")
  Category.create(:name => "Events and Parties")
  Category.create(:name => "Business")
  Category.create(:name => "Religioun and Community")
  Category.create(:name => "Career's")
  Category.create(:name => "Other's ")
  end
end
