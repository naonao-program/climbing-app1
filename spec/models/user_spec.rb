require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context 'ユーザー登録ができるとき' do
      it '空欄がなければ登録ができる' do
        expect(@user).to be_valid
      end

      it 'nicknameが半角アルファベットと数字なら登録できる' do
        @user.nickname = 'Abc1'
        expect(@user).to be_valid
      end

      it 'nicknameが数字でも登録できる' do
        @user.nickname = '111'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'nicknameが全角なら登録できない' do
        @user.nickname = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is invalid')
      end

      it 'nicknameが全角数字なら登録できない' do
        @user.nickname = '１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is invalid')
      end

      it 'nicknameが記号のときは登録できない' do
        @user.nickname = '@#$%'
        @user.valid?
        expect(@user.errors.full_messages).to include('Nickname is invalid')
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailは＠を含まないと登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下では登録できない(英数字)' do
        @user.password = '123aB'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password",
                                                      'Password is too short (minimum is 6 characters)')
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password = 'Abc123'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'boulder_gym_grade_idが{1}の場合は登録できない' do
        @user.boulder_gym_grade_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Boulder gym grade must be other than 1')
      end

      it 'lead_gym_grade_idが{1}の場合は登録できない' do
        @user.lead_gym_grade_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Lead gym grade must be other than 1')
      end

      it 'boulder_rock_grade_idが{1}の場合は登録できない' do
        @user.boulder_rock_grade_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Boulder rock grade must be other than 1')
      end

      it 'lead_rock_grade_idが{1}の場合は登録できない' do
        @user.lead_rock_grade_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Lead rock grade must be other than 1')
      end

      it 'gender_idが{1}の場合は登録できない' do
        @user.gender_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Gender must be other than 1')
      end

      it 'region_idが{1}の場合は登録できない' do
        @user.region_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Region must be other than 1')
      end

      it 'age_idが{1}の場合は登録できない' do
        @user.age_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Age must be other than 1')
      end
    end
  end
end
