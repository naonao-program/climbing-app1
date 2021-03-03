FactoryBot.define do
  factory :rock_information do
    name            {'あいうえお'}
    region_id       {'2'}
    rock_quality_id {'2'}
    address         {'大阪市'}
    season1_id      {'2'}
    season2_id      {'2'}
    night_id        {'2'}
    grade_sence_id  {'2'}
    people_day_id   {'2'}
    people_time1_id {'2'}
    people_time2_id {'2'}
    people_vibe_id  {'2'}
    other           {'かきくけこ'}

    association :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
