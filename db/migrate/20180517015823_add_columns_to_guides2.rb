class AddColumnsToGuides2 < ActiveRecord::Migration[5.2]
  def change
    add_column :guides, :meta, :jsonb
    add_column :guides, :user_id, :integer
  end
end
