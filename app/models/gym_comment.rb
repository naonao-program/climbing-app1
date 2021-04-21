class GymComment < ApplicationRecord
  belongs_to :gym_information
  belongs_to :user
end
