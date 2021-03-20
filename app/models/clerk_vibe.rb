class ClerkVibe < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '明るく接しやすい' },
    { id: 3, name: '普通' },
    { id: 4, name: '怖い印象' }
  ]
  include ActiveHash::Associations
  has_many :rock_information
  has_many :gym_information
end
