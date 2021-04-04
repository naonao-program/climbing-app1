FactoryBot.define do
  factory :gym_information do
    boulder_or_lead_id  { '2' }
    name                { 'あいうえお' }
    region_id           { '2' }
    address             { '横浜市' }
    grade_sence_id      { '2' }
    people_day_id       { '2' }
    people_time1_id     { '2' }
    people_time2_id     { '2' }
    people_vibe_id      { '2' }
    clerk_vibe_id       { '2' }
    gym_url             { 'https://www.google.com/' }
    gym_sns_url         { 'https://www.google.com/'}
    other               { 'さしすせそ' }

    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
