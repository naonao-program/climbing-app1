class RockQuality < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '石灰岩' },
    { id: 3, name: '凝灰岩' },
    { id: 4, name: '砂岩' },
    { id: 5, name: '花崗岩' },
    { id: 6, name: 'その他'}
  ]

  include ActiveHash::Associations
  has_many :rock_information
end
