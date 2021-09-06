# frozen_string_literal: true

class CreateGymInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :gym_informations do |t|
      t.string :boulder_or_lead_id, null: false
      t.string :name, null: false
      t.integer :region_id, null: false
      t.string :address, null: false
      t.float :latitude
      t.float :longitude
      t.integer :business_hours1_id, null: false
      t.integer :business_hours2_id, null: false
      t.integer :grade_sence_id, null: false
      t.integer :people_day_id, null: false
      t.integer :people_time1_id, null: false
      t.integer :people_time2_id, null: false
      t.integer :people_vibe_id, null: false
      t.integer :clerk_vibe_id, null: false
      t.string :gym_url
      t.string :gym_sns_url
      t.text :other
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
