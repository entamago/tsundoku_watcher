class GenresController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    
  end

  private
  def set_user
    @user = current_user
  end
  
  def genre_params
    params.require(:genre).permit(:genre, :genre_info).merge(user_id: current_user.id)
  end

end
