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
      visit new_gym_information_path
      # 新規投稿ページへのリンクがない
      expect(current_path).to eq new_user_session_path
    end
  end
end

RSpec.describe "Gym情報編集", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @gym1 = FactoryBot.create(:gym_information)
    @gym2 = FactoryBot.create(:gym_information)
    @gym_image = Faker::Lorem.sentence
  end
  context 'ジム情報編集できるとき' do
    it 'ログインしたユーザーは自分が投稿した投稿したものを編集ができる' do
      # ツイート1を投稿したユーザーでログインする
      sign_in(@gym1.user)
      # 編集ページへ遷移する
      visit edit_gym_information_path(@gym1)
      # すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#gym_information_name').value
      ).to eq 'あいうえお'

      expect(
        find('#gym_information_address').value
      ).to eq '横浜市'

      expect(
        find('#gym_information_gym_url').value
      ).to eq 'https://www.google.com/'

      expect(
        find('#gym_information_gym_sns_url').value
      ).to eq 'https://www.google.com/'

      expect(
        find('#gym_information_other').value
      ).to eq 'さしすせそ'
      # 投稿するボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{GymInformation.count}.by(0)

      # トップページに戻ることを確認する
      expect(current_path).to eq gym_information_path(@gym1)
    end
  end
  context 'ジム情報が編集できないとき' do
    it '投稿者が違う場合は編集できない' do
      # 投稿した以外のユーザーでログインする
      sign_in(@gym1.user)
      # ログイン以外のユーザーの投稿
      visit gym_information_path(@gym2)
      # ボタンがないことがある
      has_no_button?('編集')
    end
    it 'ログインしていない場合は編集できない' do
      visit gym_information_path(@gym2)
      # ボタンがないことがある
      has_no_button?('編集')
    end
  end
end

RSpec.describe "Gym情報削除", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @gym1 = FactoryBot.create(:gym_information)
    @gym2 = FactoryBot.create(:gym_information)
    @gym_image = Faker::Lorem.sentence
  end
  context 'ジム情報が削除できるとき' do
    it 'ログインしているユーザーと投稿しているユーザーが同じ時削除できる' do
      # ログイン
      sign_in(@gym1.user)
      # gym1のユーザーの投稿へ行く
      visit gym_information_path(@gym1)
      #ボタンが有ることを確認
      has_button?('削除')
      #ボタンを押すとトップページへ行く
    end
  end


  context 'ジム情報が削除できないとき' do
    it 'ログインしているユーザーと投稿しているユーザーが同じ時でないとき削除できない' do
      sign_in(@gym1.user)
      visit gym_information_path(@gym2)
      has_no_button?('削除')
    end

    it 'ログインしていない場合は削除できない' do
      visit gym_information_path(@gym1)
      # ボタンがないことがある
      has_no_button?('編集')
    end
  end
end