class GenresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @genres = Genre.where(user_id: @user.id)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to genres_path
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to genres_path
    else
      render :edit
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    if @genre.destroy
      redirect_to genres_path
    else
      render :edit
    end
  end

  def show
    @genre = Genre.find(params[:id])
  end

  private
  def set_user
    @user = current_user
  end
  
  def genre_params
    params.require(:genre).permit(:genre, :genre_info).merge(user_id: current_user.id)
  end

end
