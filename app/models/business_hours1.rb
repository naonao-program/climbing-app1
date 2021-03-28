class BusinessHours1 < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '9時' },
    { id: 3, name: '10時' },
    { id: 4, name: '11時' },
    { id: 5, name: '12時' },
    { id: 6, name: '13時' },
    { id: 7, name: '14時' },
    { id: 8, name: '15時' },
    { id: 9, name: '16時' },
    { id: 10, name: '17時' },
    { id: 11, name: '18時' },
    { id: 12, name: '19時' },
    { id: 13, name: '20時' },
    { id: 14, name: '21時' },
    { id: 15, name: '22時' },
    { id: 16, name: '23時' },
    { id: 17, name: '24時' },
    { id: 18, name: '1時' },
    { id: 19, name: '2時' },
    { id: 20, name: '3時' },
    { id: 21, name: '4時' },
    { id: 22, name: '5時' },
    { id: 23, name: '6時' },
    { id: 24, name: '7時' },
    { id: 25, name: '8時' },
    { id: 26, name: 'わからない' }
  ]
  include ActiveHash::Associations
  has_many :rock_information
end
