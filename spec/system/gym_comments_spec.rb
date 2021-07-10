require 'rails_helper'

RSpec.describe "gym投稿コメント機能", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @gym1 = FactoryBot.create(:gym_information)
    @gym2 = FactoryBot.create(:gym_information)
  end

  context 'gymの投稿にコメント出来る時' do
    it '正しく入力できていた場合' do
      #ログインする
      sign_in(@gym1.user)
      #投稿詳細ページに行く
      visit gym_information_path(@gym1)
      #コメントフォームがあることを確認する
      find_field('gym_comment_comment')
      #SENDボタンが有ることを確認する
      has_button?('SEND')
      #フォームに情報を記入
      fill_in 'gym_comment_comment', with: 'aaa'
      #SENDボタンを押すとモデルのカウントが1上がりコメントが表示される
      expect{
        find('input[name="commit"]').click
      }.to change {GymComment.count}.by(1)

      expect(page).to have_content('aaa')
    end
  end

  context 'gymの投稿にコメントできない時' do
    it '空のままSENDボタンを押すとコメントできない' do
      #ログインする
      sign_in(@gym1.user)
      #投稿詳細ページに行く
      visit gym_information_path(@gym1)
      #コメントフォームがあることを確認する
      find_field('gym_comment_comment')
      #フォームに情報を記入せずにSENDボタンを押す
      expect{
        find('input[name="commit"]').click
      }.to change {GymComment.count}.by(0)

      expect(page).to have_no_content('aaa')
    end

    it 'ログインしていないとコメントできない' do
      visit gym_information_path(@gym1)
      # フォームが存在しないことを確認する
      expect(page).to have_no_selector 'form'
      # 「コメントの投稿には新規登録/ログインが必要です」が表示されていることを確認する
      expect(page).to have_content 'コメントの投稿には新規登録/ログインが必要です'
    end
  end
end