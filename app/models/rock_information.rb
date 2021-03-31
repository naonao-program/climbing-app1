class RockInformation < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :rock_tasks, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :images
    validates :name
    validates :address
    with_options numericality: { other_than: 1 } do
      validates :boulder_or_lead_id
      validates :region_id
      validates :rock_quality_id
      validates :season1_id
      validates :season2_id
      validates :night_id
      validates :grade_sence_id
      validates :people_day_id
      validates :people_time1_id
      validates :people_time2_id
      validates :people_vibe_id
    end
  end

  belongs_to_active_hash :boulder_or_lead
  belongs_to_active_hash :region
  belongs_to_active_hash :rock_quality
  belongs_to_active_hash :season1
  belongs_to_active_hash :season2
  belongs_to_active_hash :night
  belongs_to_active_hash :grade_sence
  belongs_to_active_hash :people_day
  belongs_to_active_hash :people_time1
  belongs_to_active_hash :people_time2
  belongs_to_active_hash :people_vibe
end
