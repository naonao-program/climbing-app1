# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GymInformation, type: :model do
  before do
    @gym_information = FactoryBot.build(:gym_information)
  end

  describe 'ジム情報投稿' do
    context 'ジム情報投稿がうまくいくとき' do
      it 'すべての項目が正しく入力されているとき' do
        expect(@gym_information).to be_valid
      end
    end

    context 'ジム情報投稿がうまくいかないとき' do
      it 'imageが空では投稿できない' do
        @gym_information.images = nil
        @gym_information.valid?
        expect(@gym_information.errors.full_messages).to include("Images can't be blank")
      end

      it 'boulder_or_lead_idが{1}の場合は投稿できない' do
        @gym_information.boulder_or_lead_id = 1
        @gym_information.valid?
        expect(@gym_information.errors.full_messages).to include('Boulder or lead must be other than 1')
      end

      it 'nameが空では投稿できない' do
        @gym_information.name = nil
        @gym_information.valid?
        expect(@gym_information.errors.full_messages).to include("Name can't be blank")
      end

      it 'region_idが{1}の場合は登録できない' do
        @gym_information.region_id = 1
        @gym_information.valid?
        expect(@gym_information.errors.full_messages).to include('Region must be other than 1')
      end

      it 'addressが空では投稿できない' do
        @gym_information.address = nil
        @gym_information.valid?
        expect(@gym_information.errors.full_messages).to include("Address can't be blank")
      end

      it 'grade_sence_idが{1}の場合は投稿できない' do
        @gym_information.grade_sence_id = 1
        @gym_information.valid?
        expect(@gym_information.errors.full_messages).to include('Grade sence must be other than 1')
      end

      it 'people_day_idが{1}の場合は投稿できない' do
        @gym_information.people_day_id = 1
        @gym_information.valid?
        expect(@gym_information.errors.full_messages).to include('People day must be other than 1')
      end

      it 'people_time1_idが{1}の場合は投稿できない' do
        @gym_information.people_time1_id = 1
        @gym_information.valid?
        expect(@gym_information.errors.full_messages).to include('People time1 must be other than 1')
      end

      it 'people_time2_idが{1}の場合は投稿できない' do
        @gym_information.people_time2_id = 1
        @gym_information.valid?
        expect(@gym_information.errors.full_messages).to include('People time2 must be other than 1')
      end

      it 'people_vibe_idが{1}の場合は投稿できない' do
        @gym_information.people_vibe_id = 1
        @gym_information.valid?
        expect(@gym_information.errors.full_messages).to include('People vibe must be other than 1')
      end

      it 'clerk_vibe_idが{1}の場合は投稿できない' do
        @gym_information.clerk_vibe_id = 1
        @gym_information.valid?
        expect(@gym_information.errors.full_messages).to include('Clerk vibe must be other than 1')
      end
    end
  end
end
