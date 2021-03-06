class GymInformation < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  with_options presence:true do
    validates :images
    validates :name
    validates :address
    with_options numericality: { other_than: 1} do
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
end
