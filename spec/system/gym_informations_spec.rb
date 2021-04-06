require 'rails_helper'

RSpec.describe "Gym情報投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @gym = FactoryBot.build(:gym_information)
    @gym_image = Faker::Lorem.sentence
  end

  context 'Gym情報投稿できるとき' do
    it 'ログインしているユーザーが投稿できる' do
      # トップページに「ジム情報投稿」という文字があるか
      visit root_path
      expect(page).to have_content('ジム情報投稿')
      # ログインする
      sign_in(@user)
      # Gym投稿ページに行く
      visit new_gym_information_path
      # フォームに情報を記入
      has_button?('gym_information[images][]')
      attach_file('gym_information[images][]',Rails.root.join('public/images/test_image.png'))
      select('ボルダリング', from: "gym_information[boulder_or_lead_id]")
      fill_in 'gym_information_name', with: @gym.name
      select('北海道', from: "gym_information[region_id]")
      fill_in 'gym_information_address', with: @gym.address
      select('9時', from: "gym_information[business_hours1_id]")
      select('9時', from: "gym_information[business_hours2_id]")
      select('全体的に簡単', from: "gym_information[grade_sence_id]")
      select('平日', from: "gym_information[people_day_id]")
      select('9時', from: "gym_information[people_time1_id]")
      select('9時', from: "gym_information[people_time2_id]")
      select('落ち着いている', from: "gym_information[people_vibe_id]")
      select('普通', from: "gym_information[clerk_vibe_id]")
      fill_in 'gym_information_gym_url', with: @gym.gym_url
      fill_in 'gym_information_gym_sns_url', with: @gym.gym_sns_url
      fill_in 'gym_information_other', with: @gym.other
      #投稿するボダンを押すとGymInformationもでるのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { GymInformation.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # GymInformation indexページに行くとさきほど投稿したものがある
    end
  end
  context 'Gym情報投稿できないとき' do
    it 'ログインしていない場合は投稿できない' do
      # トップページに遷移する
      visit root_path
      # 新規投稿ページへのリンクがない
      expect(page).to have_no_content('ジム情報投稿')
    end
  end
end