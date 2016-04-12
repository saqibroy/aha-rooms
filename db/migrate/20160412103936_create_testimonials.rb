class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :content
      t.integer :room_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
