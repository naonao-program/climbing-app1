class CreateRockTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :rock_tasks do |t|
      t.text :name,null:false
      t.integer :grade_id,null:false
      t.text :other
      t.references :user, null:false, foreign_key: true
      t.references :rock_information, null:false, foreign_key: true
      t.timestamps
    end
  end
end
