class Night < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '○'},
    { id: 3, name: '✕'},
    { id: 4, name: 'わからない'}
  ]

  include ActiveHash::Associations
  has_many :rock_information
  
end