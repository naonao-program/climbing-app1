class BoulderGrade < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '10級' },
    { id: 3, name: '9級' },
    { id: 4, name: '8級' },
    { id: 5, name: '7級' },
    { id: 6, name: '6級' },
    { id: 7, name: '5級' },
    { id: 8, name: '4級' },
    { id: 9, name: '3級' },
    { id: 10, name: '2級' },
    { id: 11, name: '1級' },
    { id: 12, name: '初段' },
    { id: 13, name: '二段' },
    { id: 14, name: '三段' },
    { id: 15, name: '四段' },
    { id: 16, name: '五段' },
    { id: 17, name: '六段' }
  ]

  include ActiveHash::Associations
  has_many :users
end
