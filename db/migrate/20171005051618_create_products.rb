class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      #t.integer :category_id
      t.float :price
      t.integer :stock
      t.boolean :cod_available
      t.datetime :release_datetime		

      t.timestamps null: false
    end
  end
end
