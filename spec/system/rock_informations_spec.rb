require 'rails_helper'

RSpec.describe "Rock情報投稿", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @rock = FactoryBot.build(:rock_information)
    @rock_image = Faker::Lorem.sentence
  end

  context 'Rock情報が投稿できるとき' do
    it 'ログインしているユーザーが投稿できる' do
       # トップページに「岩場情報投稿」という文字があるか
       visit root_path
       expect(page).to have_content('岩場情報投稿')
      # ログインする
      sign_in(@user)
      # rock投稿ページに行く
      visit new_rock_information_path
      #フォームに情報を記入
      attach_file('rock_information[images][]',Rails.root.join('public/images/test_image.png'))
      select('ボルダリング',from: "rock_information[boulder_or_lead_id]")
      fill_in 'rock_information_name', with: @rock.name
      select('北海道', from: "rock_information[region_id]")
      select('石灰岩', from: "rock_information[rock_quality_id]")
      fill_in 'rock_information_address', with: @rock.address
      select('1月', from: "rock_information[season1_id]")
      select('1月', from: "rock_information[season2_id]")
      select('✕', from: "rock_information[night_id]")
      select('全体的に簡単', from: "rock_information[grade_sence_id]")
      select('平日', from: "rock_information[people_day_id]")
      select('9時', from: "rock_information[people_time1_id]")
      select('9時', from: "rock_information[people_time2_id]")
      select('ワイワイしている', from: "rock_information[people_vibe_id]")
      fill_in 'rock_information_other', with: @rock.other
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { RockInformation.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(rock_information_index_path)
    end
  end

  context 'Rock情報が投稿できないとき' do
    it '誤った情報では投稿できない' do
      # トップページに「岩場情報投稿」という文字があるか
      visit root_path
      expect(page).to have_content('岩場情報投稿')
      # ログインする
      sign_in(@user)
      # rock投稿ページに行く
      visit new_rock_information_path
      #フォームに情報を記入せずに投稿
      expect{
        find('input[name="commit"]').click
      }.to change { RockInformation.count }.by(0)
      #エラー文が出力される
      expect(page).to have_content("Images can't be blank")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Address can't be blank")
      expect(page).to have_content("Boulder or lead must be other than 1")
      expect(page).to have_content("Region must be other than 1")
      expect(page).to have_content("Rock quality must be other than 1")
      expect(page).to have_content("Season1 must be other than 1")
      expect(page).to have_content("Season2 must be other than 1")
      expect(page).to have_content("Night must be other than 1")
      expect(page).to have_content("Grade sence must be other than 1")
      expect(page).to have_content("People day must be other than 1")
      expect(page).to have_content("People time1 must be other than 1")
      expect(page).to have_content("People time2 must be other than 1")
      expect(page).to have_content("People vibe must be other than 1")
    end
    it 'ログインしていないと投稿ページに行けない' do
      #トップページへ遷移する
      visit root_path
      #岩場情報投稿を押す
      visit new_rock_information_path
      #新規投稿ページではなくログインページに行く
      expect(current_path).to eq(new_user_session_path)
    end
  end
end