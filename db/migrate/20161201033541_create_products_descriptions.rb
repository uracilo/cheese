class CreateProductsDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :products_descriptions do |t|
      t.references :user, foreign_key: true
      t.text :productdescription

      t.timestamps
    end
  end
end
