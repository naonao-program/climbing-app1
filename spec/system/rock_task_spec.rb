require 'rails_helper'

RSpec.describe 'Rock課題情報投稿', type: :system do
  before do
    @rock = FactoryBot.create(:rock_information)
    @rock_task = FactoryBot.create(:rock_task)
    @rock_image = Faker::Lorem.sentence
  end

  context 'Rock課題情報投稿できるとき' do
    it '正しく入力できていたとき投稿できる' do
      # 岩場の場所を投稿しているユーザーでログインする
      sign_in(@rock.user)
      # 岩場情報の投稿詳細ページへ行く
      visit rock_information_path(@rock)
      # 課題の投稿はこちらがあるか確認
      has_button?("#{@rock.name}の課題の投稿はこちら")
      visit new_rock_information_rock_task_path(@rock)
      # 正しく入力
      attach_file('rock_task[images][]', Rails.root.join('public/images/test_image.png'))
      fill_in 'rock_task[name]', with: 'さしすせそ'
      select('初段', from: 'rock_task[rock_task_grade_id]')
      fill_in 'rock_task[youtube_url]', with: @rock_task.youtube_url
      fill_in 'rock_task[other]', with: @rock_task.other
      # モデルのカウントが上がる
      expect  do
        find('input[name="commit"]').click
      end.to change { RockTask.count }.by(1)
      # リダイレクトする先あっている
      expect(current_path).to eq(rock_information_path(@rock))
      # 投稿したものがあるか確認
      expect(page).to have_content('さしすせそ')
      expect(page).to have_content('初段')
    end
  end

  context 'Rock課題情報が投稿できない時' do
    it 'フォームに正しく記入できていない時' do
      sign_in(@rock.user)
      visit new_rock_information_rock_task_path(@rock)
      # フォームに何も書かずに投稿する
      expect do
        find('input[name="commit"]').click
      end.to change { RockTask.count }.by(0)
      # エラー分が出力される
      expect(page).to have_content("Images can't be blank")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content('Rock task grade must be other than 1')
    end
  end
end
