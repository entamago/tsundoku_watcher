class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  
  def show
    @user = current_user
    @articles = Article.where(user_id: @user.id).order(id: :DESC)
    @genres = Genre.where(user_id: @user.id)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :purpose)
  end
end
