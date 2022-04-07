class AddInfosToClubs < ActiveRecord::Migration[6.1]
  def change
    add_column :clubs, :short_name, :string
    add_column :clubs, :description, :text
  end
end
