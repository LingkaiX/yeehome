class CreateBusinesses < ActiveRecord::Migration[5.2]
  def change
    create_table :businesses do |t|
      t.string :title
      t.string :desc

      t.timestamps
    end
  end
end
