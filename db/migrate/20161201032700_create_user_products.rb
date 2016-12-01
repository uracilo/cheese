class CreateUserProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :user_products do |t|
      t.references :user, foreign_key: true
      t.text :productdescription
      t.integer :quantity
      t.integer :price
      t.integer :weight

      t.timestamps
    end
  end
end
