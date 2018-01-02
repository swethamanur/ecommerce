class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name 	

      t.timestamps null: false
      #created_at
      #updated_at
    end
  end
end
