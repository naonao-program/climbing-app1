class CreateRockTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :rock_tasks do |t|
      t.text :name,null:false
      t.integer :rock_task_grade_id,null:false
      t.text :other
      t.integer :user_id
      t.integer :rock_information_id
      t.timestamps
    end
  end
end
