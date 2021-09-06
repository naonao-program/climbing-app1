# frozen_string_literal: true

FactoryBot.define do
  factory :gym_comment do
    comment     { 'こんにちは' }
    gym_comment { '1' }
    user_id     { '1' }
  end
end
