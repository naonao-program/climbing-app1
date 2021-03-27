require 'rails_helper'

RSpec.describe RockTask, type: :model do
  before do
    @task = FactoryBot.build(:rock_task)
  end

  describe '岩課題情報投稿' do
    context '岩課題情報投稿がうまくいくとき' do
      it 'すべての項目が正しく入力されているときは投稿できる' do
        expect(@task).to be_valid
      end
    end

    context '岩課題情報投稿がうまくいないとき' do
      it 'imagesが空のときは投稿できない' do
        @task.images = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Images can't be blank")
      end

      it 'nameが空のときは投稿できない' do
        @task.name = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("Name can't be blank")
      end

      # it 'nameがすでに使われている場合は投稿できない' do
      #   @task.save
      #   @task.name = 'かきくけこ'
      #   @task.valid?
      #   expect(@task.errors.full_messages).to include("Name has already been taken")
      # end

      it 'rock_task_gradeが１のときは投稿できない' do
        @task.rock_task_grade_id = 1
        @task.valid?
        expect(@task.errors.full_messages).to include("Rock task grade must be other than 1")
      end
    end
  end
end
