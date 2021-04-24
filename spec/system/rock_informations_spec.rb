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
      select('石灰岩' ,form: "rock_information[rock_quality_id]")
      fill_in 'rock_information_address', with: @rock.address
      select('1月', form: "rock_information[season1_id]")
      select('1月',form: "rock_information[season2_id]")
      select('✕',form: "rock_information[night_id]")
    end
  end
end