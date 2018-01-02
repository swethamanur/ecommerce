class ProductToItemId < ActiveRecord::Migration
  def change
  	rename_column :order_line_items, :product_id, :item_id
  end
end
