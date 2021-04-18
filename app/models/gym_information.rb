class GymInformation < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  extend ActiveHash::Associations::ActiveRecordExtensions

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.search(search)
    if search != ""
      GymInformation.where('text LIKE(?)', "%#{search}%")
    else
      GymInformation.all
    end
  end

  with_options presence: true do
    validates :images
    validates :name
    validates :address
    with_options numericality: { other_than: 1 } do
      validates :boulder_or_lead_id
      validates :region_id
      validates :grade_sence_id
      validates :business_hours1_id
      validates :business_hours2_id
      validates :people_day_id
      validates :people_day_id
      validates :people_time1_id
      validates :people_time2_id
      validates :people_vibe_id
      validates :clerk_vibe_id
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :boulder_or_lead
  belongs_to_active_hash :region
  belongs_to_active_hash :grade_sence
  belongs_to_active_hash :people_day
  belongs_to_active_hash :people_time1
  belongs_to_active_hash :people_time2
  belongs_to_active_hash :people_vibe
  belongs_to_active_hash :clerk_vibe
  belongs_to_active_hash :business_hours1
  belongs_to_active_hash :business_hours2
end
