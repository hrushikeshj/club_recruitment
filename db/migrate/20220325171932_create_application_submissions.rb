class CreateApplicationSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :application_submissions do |t|
      t.belongs_to :application, null: false, foreign_key: true
      t.belongs_to :club, null: false, foreign_key: true
      t.integer :preference_no
      t.integer :status, default: 0
      t.decimal :marks
      t.boolean :selected, default: false

      t.timestamps
    end
  end
end
