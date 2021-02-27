class CreateRockInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :rock_informations do |t|
      t.string :name, null:false
      t.integer :region_id, null:false
      t.integer :rock_quality_id, null:false
      t.string :address, null:false
      t.integer :season1_id, null:false
      t.integer :season2_id, null:false
      t.integer :night_id, null:false
      t.integer :grade_sence_id, null:false
      t.integer :people_day1_id, null:false
      t.integer :people_day2_id, null:false
      t.integer :people_time1_id, null:false
      t.integer :people_time2_id, null:false
      t.integer :people_vibe_id, null:false
      t.text :other
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
