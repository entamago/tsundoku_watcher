class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :check_user_g, only:[:new, :create, :update]
  before_action :check_user_a, only:[:edit, :destroy, :show]

  def new
    @genre = Genre.find(params[:genre_id])
    @article = Article.new
  end

  def create
    @genre = Genre.find(params[:genre_id])
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "積み上げご苦労さまです！#{@genre.genre}の記事を投稿しました！"
      redirect_to genre_path(params[:genre_id])
    else
      flash.now[:danger] = "記事が作成出来ませんでした"
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
      flash[:success] = "情報を更新しました！記事の編集お疲れさまです！"
      redirect_to genre_article_path(genre_id: params[:genre_id], id: params[:id])
    else
      flash.now[:danger] = "記事が編集出来ませんでした"
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

  def search
    @articles = Article.search(params[:keyword]).where(user_id: @user.id).page(params[:page]).per(12)
    @keyword = params[:keyword]
    render "search"
  end

  private
  def set_user
    @user = current_user
  end

  def article_params
    params.require(:article).permit(:title, :article, :reference_info).merge(user_id: @user.id, genre_id: params[:genre_id])
  end

  def check_user_g
    @genre = Genre.find(params[:genre_id])
    redirect_to root_path unless @genre.user_id == current_user.id
  end

  def check_user_a
    @article = Article.find(params[:id])
    redirect_to root_path unless @article.user_id == current_user.id
  end
end
