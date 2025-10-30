class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.text :bio
      t.string :profile_image_url

      t.timestamps
    end
    add_index :users, :email
  end
end
