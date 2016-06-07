class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :name
      t.text :content
      t.integer :status
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
