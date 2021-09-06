# frozen_string_literal: true

FactoryBot.define do
  factory :rock_task do
    name                 { Faker::Name.name }
    rock_task_grade_id   { '2' }
    youtube_url          { 'https://youtu.be/Ks71YWIDEuM' }
    other                { 'さしすせそ' }

    association :user
    association :rock_information

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
