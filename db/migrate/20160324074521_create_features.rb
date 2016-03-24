class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
