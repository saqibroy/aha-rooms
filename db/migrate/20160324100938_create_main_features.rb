class CreateMainFeatures < ActiveRecord::Migration
  def change
    create_table :main_features do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
