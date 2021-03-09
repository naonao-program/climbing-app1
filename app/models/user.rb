class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :boulder_gym_grade_id
    validates :lead_gym_grade_id
    validates :boulder_rock_grade_id
    validates :lead_rock_grade_id
    validates :gender_id
    validates :region_id
    validates :age_id
  end

  with_options numericality: { other_than: 1 } do
    validates :boulder_gym_grade_id
    validates :lead_gym_grade_id
    validates :boulder_rock_grade_id
    validates :lead_rock_grade_id
    validates :gender_id
    validates :region_id
    validates :age_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :boulder_grade
  belongs_to_active_hash :lead_grade
  belongs_to_active_hash :gender
  belongs_to_active_hash :region
  belongs_to_active_hash :age
end
