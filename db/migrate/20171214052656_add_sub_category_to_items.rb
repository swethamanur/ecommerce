class AddSubCategoryToItems < ActiveRecord::Migration
  def change
    add_column :items, :sub_category_id, :integer
  end
end
