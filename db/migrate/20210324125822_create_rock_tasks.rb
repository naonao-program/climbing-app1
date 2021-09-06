# frozen_string_literal: true

class CreateRockTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :rock_tasks do |t|
      t.text :name, null: false
      t.integer :rock_task_grade_id, null: false
      t.string :youtube_url
      t.text :other
      t.references :user, null: false, foreign_key: true
      t.references :rock_information, null: false, foreign_key: true
      t.timestamps
    end
  end
end
