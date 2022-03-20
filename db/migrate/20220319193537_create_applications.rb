class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.references :user
      t.text :projects
      t.text :skills
      t.string :github_link

      t.timestamps
    end
  end
end
