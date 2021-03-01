class RockInformation < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  with_options presence:true do
    validates :name
    validates :address
    with_options numericality: { other_than: 1} do
      validates :region_id
      validates :rock_quality_id
      validates :season1_id
      validates :season2_id
      validates :night_id
      validates :grade_sence_id
      validates :people_day1_id
      validates :people_day2_id
      validates :people_time1_id
      validates :people_day2_id
      validates :people_vibe_id
    end
  end

end
