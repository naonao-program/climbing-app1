# frozen_string_literal: true

class BoulderOrLead < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ボルダリング' },
    { id: 3, name: 'リード' },
    { id: 4, name: 'スピード' },
    { id: 5, name: 'ボルダリングとリード' },
    { id: 6, name: 'ボルダリングとリードとスピード' },
    { id: 7, name: 'ボルダリングとスピード' },
    { id: 8, name: 'リードとスピード' }
  ]
  include ActiveHash::Associations
  has_many :rock_information
  has_many :gym_information
end
