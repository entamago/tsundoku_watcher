class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @goals = Goal.where(user_id: @user.id).order(created_at: :DESC)
    @now_goal = @goals.first
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goals_path
    else
      render :edit
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    if @goal.destroy
      redirect_to goals_path
    else
      render :index
    end
  end

  private
  def set_user
    @user = current_user
  end

  def goal_params
    params.require(:goal).permit(:short_tern_goal, :routine, :time_limit, :achievement).merge(user_id: current_user.id)
  end

end
