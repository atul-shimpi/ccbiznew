class CreatePaymentnotifications < ActiveRecord::Migration
  def change
    create_table :paymentnotifications do |t|
      t.text :description
      t.references :payment, index: true, foreign_key: true
      t.references :site_user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
