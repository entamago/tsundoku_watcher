require 'rails_helper'

RSpec.describe Genre, type: :model do
  before do
    @genre = FactoryBot.build(:genre)
  end

  describe 'ジャンル追加' do
    context 'ジャンル追加ができるとき' do
      it 'genre、genre_infoが存在すれば追加できる' do
        expect(@genre).to be_valid
      end
      it 'genreが存在すればgenre_infoは空でも登録できる' do
        @genre.genre_info = ''
        expect(@genre).to be_valid
      end
    end

    context 'ジャンルが追加出来ないとき' do
      it 'genreが存在しないと登録できない' do
        @genre.genre = ''
        @genre.valid?
        expect(@genre.errors.full_messages).to include('ジャンルを入力してください')
      end
      it 'userが紐付いていないと登録できない' do
        @genre.user = nil
        @genre.valid?
        expect(@genre.errors.full_messages).to include('Userを入力してください')
      end
    end

  end
end
