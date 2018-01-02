class AddNetPriceToItems < ActiveRecord::Migration
  def change
    add_column :items, :net_price, :integer
  end
end
