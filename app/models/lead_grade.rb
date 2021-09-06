# frozen_string_literal: true

class LeadGrade < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '5.7台' },
    { id: 3, name: '5.8台' },
    { id: 4, name: '5.9台' },
    { id: 5, name: '5.10台' },
    { id: 6, name: '5.11台' },
    { id: 7, name: '5.12台' },
    { id: 8, name: '5.13台' },
    { id: 9, name: '5.14台' },
    { id: 10, name: '5.15台' }
  ]

  include ActiveHash::Associations
  has_many :users
end
