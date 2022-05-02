class CreateRecruitmentConfigs < ActiveRecord::Migration[6.1]
  def change
    create_table :recruitment_configs do |t|
      t.string :key
      t.text :congif
      t.datetime :date, default: -> { 'CURRENT_TIMESTAMP' }

      t.timestamps
    end
  end
end
