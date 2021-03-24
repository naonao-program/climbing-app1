class RockTask < ApplicationRecord
  belongs_to :user

  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :images
    with_options uniqueness: true do
      validates :name
    end
    with_options numericality: { other_than: 1 } do
      validates :rock_task_grade_id
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :rock_task_grade_id
end
