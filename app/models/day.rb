class Day < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '平日' },
    { id: 3, name: '土日•祝日' },
    { id: 4, name: '月曜日' },
    { id: 5, name: '火曜日' },
    { id: 6, name: '水曜日' },
    { id: 7, name: '木曜日' },
    { id: 8, name: '金曜日' },
    { id: 9, name: '土曜日' },
    { id: 10, name: '日曜日' },
    { id: 11, name: 'わからない' }
  ]
  include ActiveHash::Associations
  has_many :rock_information
end
