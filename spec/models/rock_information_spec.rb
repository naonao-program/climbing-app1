require 'rails_helper'

RSpec.describe RockInformation, type: :model do
  before do
    @rock_information = FactoryBot.build(:rock_information)
  end

  describe '岩情報投稿' do
    context '岩情報投稿がうまくいくとき' do
      it 'すべての項目が正しく入力されていた場合は投稿できる' do
        expect(@rock_information).to be_valid
      end
    end

    context '岩情報投稿がうまくいかないとき' do
      it 'imageが空では投稿できない' do
        @rock_information.images = nil
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("Images can't be blank")
      end
      
      it 'nameが空では投稿できない' do
        @rock_information.name = nil
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("Name can't be blank")
      end

      it 'addressが空欄のときは投稿できない' do
        @rock_information.address = nil
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("Address can't be blank")
      end

      it 'region_idが{1}のときは投稿できない' do
        @rock_information.region_id = 1
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("Region must be other than 1")
      end

      it 'rock_quality_idが{1}のときは投稿できない' do
        @rock_information.rock_quality_id = 1
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("Rock quality must be other than 1")
      end

      it 'season1_idが{1}のときは投稿できない' do
        @rock_information.season1_id = 1
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("Season1 must be other than 1")
      end

      it 'season2_idが{1}のときは投稿できない' do
        @rock_information.season2_id = 1
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("Season2 must be other than 1")
      end

      it 'night_idが{1}のときは投稿できない' do
        @rock_information.night_id = 1
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("Night must be other than 1")
      end

      it 'grade_sence_idが{1}のときは投稿できない' do
        @rock_information.grade_sence_id = 1
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("Grade sence must be other than 1")
      end

      it 'people_day_idが{1}のときは投稿できない' do
        @rock_information.people_day_id = 1
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("People day must be other than 1")
      end

      it 'people_time1_idが{1}のときは投稿できない' do
        @rock_information.people_time1_id = 1
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("People time1 must be other than 1")
      end

      it 'people_time2_idが{1}のときは投稿できない' do
        @rock_information.people_time2_id = 1
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("People time2 must be other than 1")
      end

      it 'people_vibe_idが{1}のときは投稿できない' do
        @rock_information.people_vibe_id = 1
        @rock_information.valid?
        expect(@rock_information.errors.full_messages).to include("People vibe must be other than 1")
      end
    end
  end
end
