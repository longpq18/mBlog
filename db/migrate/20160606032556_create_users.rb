class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :uname
      t.string :pword
      t.string :email
      t.text :address
      t.integer :phone
      t.integer :permission_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
