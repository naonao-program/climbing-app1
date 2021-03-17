class GymInformation < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :images
    validates :name
    validates :address
    with_options numericality: { other_than: 1 } do
      validates :boulder_or_lead_id
      validates :region_id
      validates :grade_sence_id
      validates :people_day_id
      validates :people_day_id
      validates :people_time1_id
      validates :people_time2_id
      validates :people_vibe_id
      validates :clerk_vibe_id
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :boulder_or_lead_id
  belongs_to_active_hash :region_id
  belongs_to_active_hash :grade_sence_id
  belongs_to_active_hash :people_day_id
  belongs_to_active_hash :people_time1_id
  belongs_to_active_hash :people_time2_id
  belongs_to_active_hash :people_vibe_id
  belongs_to_active_hash :clerk_vibe_id
end
