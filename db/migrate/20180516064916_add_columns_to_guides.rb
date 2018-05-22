class AddColumnsToGuides < ActiveRecord::Migration[5.2]
  def change
    add_column :guides, :content, :text
    add_column :guides, :status, :integer
    add_index :guides, :status
    add_column :guides, :type, :integer
    add_index :guides, :type
  end
end
