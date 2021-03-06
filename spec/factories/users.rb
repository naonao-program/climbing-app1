FactoryBot.define do
  factory :user do
    nickname              { 'abc123'}
    email                 { Faker::Internet.free_email }
    password              { 'test1234' }
    password_confirmation { 'test1234' }
    boulder_gym_grade_id  { '2' }
    lead_gym_grade_id     { '2' }
    boulder_rock_grade_id { '2' }
    lead_rock_grade_id    { '2' }
    gender_id             { '2' }
    region_id             { '2' }
    age_id                { '2' }
  end
end
