class AddImageToTestimonials < ActiveRecord::Migration
  def change
    add_column :testimonials, :image, :string
  end
end
