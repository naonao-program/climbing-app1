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

RSpec.describe "Rock情報編集", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @rock1 = FactoryBot.create(:rock_information)
    @rock2 = FactoryBot.create(:rock_information)
    @rock_image = Faker::Lorem.sentence
  end
  context '岩場情報が編集できる時' do
    it 'ログインしたユーザーは自分が投稿した投稿したものを編集ができる' do
    #投稿1を投稿したユーザーでログインする
    sign_in(@rock1.user)
    #投稿詳細ページへ遷移
    visit rock_information_path(@rock1)
    #編集ボタンが有るか
    expect(page).to have_link '編集', href: edit_rock_information_path(@rock1)
    #編集ページへ遷移する
    visit edit_rock_information_path(@rock1)
    #すでに投稿済みの内容がフォームに入っていることを確認
    expect(page).to have_selector("img[src$='test_image.png']")

    expect(page).to have_select('rock_information[boulder_or_lead_id]', selected: 'ボルダリング')

    expect(
      find('#rock_information_name').value
    ).to eq @rock1.name

    expect(page).to have_select('rock_information[region_id]', selected: '北海道')

    expect(page).to have_select('rock_information[rock_quality_id]', selected: '石灰岩')

    expect(
      find('#rock_information_address').value
    ).to eq '大阪市'

    
    expect(page).to have_select('rock_information[season1_id]', selected: '1月')

    expect(page).to have_select('rock_information[season2_id]', selected: '1月')

    expect(page).to have_select('rock_information[night_id]', selected: '○')

    expect(page).to have_select('rock_information[grade_sence_id]', selected: '全体的に簡単')

    expect(page).to have_select('rock_information[grade_sence_id]', selected: '全体的に簡単')

    expect(page).to have_select('rock_information[people_day_id]', selected: '平日')

    expect(page).to have_select('rock_information[people_time1_id]', selected: '9時')

    expect(page).to have_select('rock_information[people_time2_id]', selected: '9時')

    expect(page).to have_select('rock_information[people_vibe_id]', selected: 'ワイワイしている')

    expect(
      find('#rock_information_other').value
    ).to eq 'かきくけこ'

    # 編集してもRockInformationモデルのカウントは変わらないことを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { RockInformation.count }.by(0)
    expect(current_path).to eq rock_information_path(@rock1)
    end
  end
  context '岩場情報投稿が編集できない時' do
    it '投稿者が違う場合は編集できない' do
      #投稿した以外のユーザーでログインする
      sign_in(@rock1.user)
      #ログイン以外のユーザーの投稿
      visit rock_information_path(@rock2)
      # 編集ボタンがないことを確かめる
      has_no_button?('編集')
    end
    
    it 'ログインしていない場合は編集できない' do
      visit rock_information_path(@rock2)
      # 編集ボタンがないことを確かめる
      has_no_button?('編集')
    end
  end
end

RSpec.describe "Rock情報削除", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @rock1 = FactoryBot.create(:rock_information)
    @rock2 = FactoryBot.create(:rock_information)
  end
  context '岩場情報が削除できるとき' do
    it 'ログインしているユーザーと投稿しているユーザーが同じ時は削除できる' do
      #ユーザー1でログイン
      sign_in(@rock1.user)
      #ユーザ1の投稿へいき「削除」ボタンが有ることを確認
      visit rock_information_path(@rock1)
      has_button?('削除')
      #「削除」ボタンを押すとトップページに行く
      expect{
        find('a[data-method="delete"').click
      }.to change { RockInformation.count }.by(-1)
      expect(current_path).to eq root_path
    end
  end
  
  context '岩場情報が削除できない時' do
    it 'ログインしているユーザーと投稿しているユーザーが同じでないときは削除できない' do
      sign_in(@rock1.user)
      visit rock_information_path(@rock2)
      has_no_button?('削除')
    end
    it 'ログインしていない場合は削除できない' do
      visit rock_information_path(@rock2)
      has_no_button?('削除')
    end
  end
end

RSpec.describe "Rock情報詳細表示", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @rock1 = FactoryBot.create(:rock_information)
    @rock2 = FactoryBot.create(:rock_information)
  end

  context 'rock情報詳細表示が見れる時' do
    it 'ログインしてなくても見ることが出来る' do
      visit rock_information_path(@rock1)
      expect(current_path).to eq rock_information_path(@rock1)
    end
  end
end