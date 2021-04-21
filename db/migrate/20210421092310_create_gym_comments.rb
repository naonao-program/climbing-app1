class CreateGymComments < ActiveRecord::Migration[6.1]
  def change
    create_table :gym_comments do |t|
      t.text :comment, null:false
      t.integer :user_id
      t.integer :gym_information_id
      t.timestamps
    end
  end
end
