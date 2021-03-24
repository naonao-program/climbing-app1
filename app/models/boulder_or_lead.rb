class BoulderOrLead < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ボルダリング' },
    { id: 3, name: 'リード' },
    { id: 4, name: 'ボルダリングとリード' }
  ]
  include ActiveHash::Associations
  has_many :rock_information
  has_many :gym_information
end
