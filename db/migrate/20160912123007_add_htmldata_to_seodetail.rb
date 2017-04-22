class AddHtmldataToSeodetail < ActiveRecord::Migration
  def change
    add_column :seodetails, :htmldata, :text
  end
end
