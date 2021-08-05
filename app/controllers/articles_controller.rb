class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def new
    @genre = Genre.find(params[:genre_id])
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to genre_path(params[:genre_id])
    else
      render :new
    end
  end

  private
  def set_user
    @user = current_user
  end

  def article_params
    params.require(:article).permit(:title, :article, :reference_info).merge(user_id: @user.id, genre_id: params[:genre_id])
  end
end
