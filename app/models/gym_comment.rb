class GymComment < ApplicationRecord
  belongs_to :gym_information
  belongs_to :user
  
  validates :comment, presence: true
end
