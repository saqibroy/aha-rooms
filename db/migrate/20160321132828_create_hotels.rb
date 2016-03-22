class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :city
      t.string :state

      t.timestamps null: false
    end
  end
end
