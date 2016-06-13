class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :name
      t.text :content
      t.string :website
      t.string :regency

      t.timestamps null: false
    end
  end
end
