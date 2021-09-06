# frozen_string_literal: true

class GradeSence < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '全体的に簡単' },
    { id: 3, name: '全体的に普通' },
    { id: 4, name: '全体的に難しめ' },
    { id: 5, name: 'わからない' }
  ]
  include ActiveHash::Associations
  has_many :rock_information
end
