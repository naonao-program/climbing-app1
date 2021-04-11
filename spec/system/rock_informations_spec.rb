require 'rails_helper'

RSpec.describe "Rock情報投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @rock = FactoryBot.build(:rock_information)
    @rock_image = Faker::Lorem.sentence
  end

  context 'Rock情報が投稿できるとき' do
    it 'ログインしているユーザーが投稿できる' do
       # トップページに「岩情報投稿」という文字があるか
       visit root_path
       expect(page).to have_content('岩情報投稿')
      # ログインする
      sign_in(@user)
      # Gym投稿ページに行く
      visit new_gym_information_path
    end
  end
end