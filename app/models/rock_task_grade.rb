class RockTaskGrade < ActiveHash::Base
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
    { id: 17, name: '六段' },
    { id: 18, name: '5.7台' },
    { id: 19, name: '5.8台' },
    { id: 20, name: '5.9台' },
    { id: 21, name: '5.10台' },
    { id: 22, name: '5.11台' },
    { id: 23, name: '5.12台' },
    { id: 24, name: '5.13台' },
    { id: 25, name: '5.14台' },
    { id: 26, name: '5.15台' }
  ]

  include ActiveHash::Associations
  has_many :rock_tasks
end
