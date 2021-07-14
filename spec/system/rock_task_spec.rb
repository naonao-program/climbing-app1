require 'rails_helper'

RSpec.describe "Rock課題情報投稿", type: :system do
  before do
    @rock = FactoryBot.create(:rock_information)
    @rock_task = FactoryBot.create(:rock_task)
    @rock_image = Faker::Lorem.sentence
  end

  context 'Rock課題情報投稿できるとき' do
    it '正しく入力できていたとき投稿できる' do
      #岩場の場所を投稿しているユーザーでログインする
      sign_in(@rock.user)
      #岩場情報の投稿詳細ページへ行く
      visit rock_information_path(@rock)
      #課題の投稿はこちらがあるか確認
      has_button?("#{@rock.name}の課題の投稿はこちら")
      visit new_rock_information_rock_task_path(@rock)
      #正しく入力
      attach_file('rock_task[images][]',Rails.root.join('public/images/test_image.png'))
      fill_in 'rock_task[name]', with: @rock_task.name
      select('初段', from:"rock_task[rock_task_grade_id]")
      fill_in 'rock_task[youtube_url]', with: @rock_task.youtube_url
      fill_in 'rock_task[other]', with: @rock_task.other
      #モデルのカウントが上がる
      expect{
        find('input[name="commit"]').click
      }.to change { RockTask.count }.by(1)
      #リダイレクトする先あっている
      expect(current_path).to eq(rock_information_path(@rock))
      #投稿したものがあるか確認
      expect(page).to have_content(@rock_task.name)
      expect(page).to have_content('初段')
    end
  end
end