# frozen_string_literal: true

class CreateRockComments < ActiveRecord::Migration[6.1]
  def change
    create_table :rock_comments do |t|
      t.text :comment, null: false
      t.integer :user_id
      t.integer :rock_information_id
      t.timestamps
    end
  end
end
