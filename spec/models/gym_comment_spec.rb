require 'rails_helper'

RSpec.describe GymComment, type: :model do
  before do
    @gym_comment = FactoryBot.build(:gym_comment)
  end

  describe 'ジム情報コメント投稿' do
    context 'ジム情報コメント投稿がうまくいくとき' do
      it '正しく入力されているとき' do
        expect(@gym_comment).to be_valid
      end
    end

    context 'ジム情報コメント投稿がうまく行かないとき' do
    end
  end
end
