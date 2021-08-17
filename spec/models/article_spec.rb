require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '学習記事の追加' do
    context '記事を追加できるとき' do
      it 'title、article、reference_infoが存在すれば追加できる' do
        expect(@article).to be_valid
      end
      it 'title、articleが存在すればreference_infoが空でも記事を追加できる' do
        @article.reference_info = ''
        expect(@article).to be_valid
      end
      it 'titleは20文字まで登録できる' do
        @article.title = '12345678901234567890'
        expect(@article).to be_valid
      end
      it 'articleは200文字まで登録できる' do
        @article.article = '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890'
        expect(@article).to be_valid
      end
    end

    context '記事を追加できないとき' do
      it 'titleが空では追加出来ない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include('タイトルを入力してください')
      end
      it 'titleが21字以上だと追加できない' do
        @article.title = '123456789012345678901'
        @article.valid?
        expect(@article.errors.full_messages).to include('タイトルは20文字以内で入力してください')
      end
      it 'articleが空では追加できない' do
        @article.article = ''
        @article.valid?
        expect(@article.errors.full_messages).to include('記事内容を入力してください')
      end
      it 'articleが201文字以上だと登録できない' do
        @article.article = '123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901'
        @article.valid?
        expect(@article.errors.full_messages).to include('記事内容は200文字以内で入力してください')
      end
      it 'genreが紐付いていないと追加できない' do
        @article.genre = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('Genreを入力してください')
      end
      it 'userが紐付いていないと追加できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
