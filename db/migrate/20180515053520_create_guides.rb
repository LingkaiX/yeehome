class CreateGuides < ActiveRecord::Migration[5.2]
  def change
    create_table :guides do |t|
      t.string :title
      t.string :desc

      t.timestamps
    end
  end
end
