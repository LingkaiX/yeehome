class AddCategoryToGuide < ActiveRecord::Migration[5.2]
  def change
    add_column :guides, :category_id, :integer
  end
end
