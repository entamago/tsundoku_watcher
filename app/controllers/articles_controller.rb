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

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:genre_id])
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to genre_article_path(genre_id: params[:genre_id], id: params[:id])
    else
      render :edit
    end 
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to genre_path(@article.genre)
    else
      render :edit
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def set_user
    @user = current_user
  end

  def article_params
    params.require(:article).permit(:title, :article, :reference_info).merge(user_id: @user.id, genre_id: params[:genre_id])
  end
end
