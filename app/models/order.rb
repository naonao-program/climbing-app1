# frozen_string_literal: true

class Order < ApplicationRecord
  attr_accessor :token

  validates :price, presence: true, numericality: true, numericality: { equal_to: 500 }
  validates :token, presence: true
end
