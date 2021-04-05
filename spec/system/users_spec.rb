require 'rails_helper'

RSpec.describe "ユーザー新規登録", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録できるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Sign Up.')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      fill_in 'Nickname', with: @user.nickname
      select(value = "2", from: "user[boulder_gym_grade_id]")
      select(value = "2", from: "user[lead_gym_grade_id]")
      select(value = "2", from: "user[boulder_rock_grade_id]")
      select(value = "2", from: "user[lead_rock_grade_id]")
      select('男性', from: "user[gender_id]")
      select('北海道', from: "user[region_id]")
      select(value = "2", from: "user[age_id]")
      # サインアップボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
      # ログアウトボタンが表示されることを確認する
      expect(page).to have_content('Logout.')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('Sign Up.')
      expect(page).to have_no_content('Login.')
    end
  end

  context 'ユーザー新規登録できないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content("Sign Up.")
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'Email', with: ""
      fill_in 'Password', with: ""
      fill_in 'Password confirmation', with: ""
      fill_in 'Nickname', with: ""
      select('--', from: "user[boulder_gym_grade_id]")
      select('--', from: "user[lead_gym_grade_id]")
      select('--', from: "user[boulder_rock_grade_id]")
      select('--', from: "user[lead_rock_grade_id]")
      select('--', from: "user[gender_id]")
      select('--', from: "user[region_id]")
      select('--', from: "user[age_id]")
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{User.count}.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(current_path).to eq "/users"
    end
  end
end
