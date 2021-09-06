# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'group入会', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'groupに入会できる時' do
    it '正しく項目に情報が入れられている時' do
      # ログインし購入ページに行く
      sign_in(@user)
      visit new_order_path
      # フォームに情報を記入
      fill_in 'order_number', with: '4242424242424242'
      fill_in 'order_cvc', with: '123'
      fill_in 'order_exp_month', with: '3'
      fill_in 'order_exp_year', with: '30'
      click_on '購入'
      # slackへのURLというボタンが表示される
      expect(page).to have_link 'SlackへのURL', href: 'https://climbingteamhq.slack.com'
    end
  end

  context 'groupに入会できない時' do
    it 'ログインしていない時group#indexへ行くとログインページに行く' do
      visit new_order_path
      expect(current_path).to eq(new_user_session_path)
    end

    it '正しく情報が入力されていない時は入会できない' do
      sign_in(@user)
      visit new_order_path
      # フォームを空のまま購入ボタン
      click_on '購入'
      # エラーメッセージが出る
      expect(page).to have_content("Token can't be blank")
    end
  end
end
