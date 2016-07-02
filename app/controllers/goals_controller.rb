class GoalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @goals = Goal.order(:created_at)
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to root_path, alert: 'Goal was successfully created.'
    else
      redirect_to root_path, error: 'Something went wrong!'
    end
  end

  private
  def goal_params
    params.require(:goal).permit(:name, :due, :notify_at)
  end

end
