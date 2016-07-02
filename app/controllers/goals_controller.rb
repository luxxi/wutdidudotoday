class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :goals

  def index
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to root_path, alert: 'Goal was successfully created.'
    else
      goals
      render :index
    end
  end

  private
  def goal_params
    params.require(:goal).permit(:name, :due, :notify_at)
  end

  def goals
    @goals = current_user.goals.active
  end

end
