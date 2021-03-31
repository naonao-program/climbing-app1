class CreateRockTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :rock_tasks do |t|
      t.text :name,null:false
      t.integer :rock_task_grade_id,null:false
      t.string :youtube_url
      t.text :other
      t.integer :user_id, null:false
      t.integer :rock_information_id, null:false
      t.timestamps
    end
  end
end
