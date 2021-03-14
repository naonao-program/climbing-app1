class Vibe < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ワイワイしている' },
    { id: 3, name: '静かに登っている' },
    { id: 4, name: 'よくわからない' }
  ]

  include ActiveHash::Associations
  has_many :rock_information
  has_many :gym_information
end
