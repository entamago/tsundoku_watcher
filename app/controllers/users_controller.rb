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
    flash.clear
    @user = current_user
    @articles = Article.where(user_id: @user.id).order(updated_at: :DESC)
    @genres = Genre.where(user_id: @user.id)
    @now_goal = Goal.where(user_id: @user.id).order(created_at: :DESC).first
    @achievements = Goal.where(user_id: @user.id, achievement: true)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :purpose)
  end
end
