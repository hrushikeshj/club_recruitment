class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :roll_no
      t.string :email
      t.integer :club_id
      t.string :password_digest

      t.timestamps
    end
  end
end
