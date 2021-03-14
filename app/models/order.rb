class Order < ApplicationRecord
  validates :price, presence: true,numericality: true,numericality: {equal_to: 500}
end
