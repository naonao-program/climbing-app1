# frozen_string_literal: true

class RockComment < ApplicationRecord
  belongs_to :rock_information
  belongs_to :user

  validates :comment, presence: true
end
