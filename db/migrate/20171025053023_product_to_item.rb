class ProductToItem < ActiveRecord::Migration
  def change
  	rename_column :cart_line_items, :product_id, :item_id
  end
end
