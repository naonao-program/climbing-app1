class RockTaskController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
  end

  def new
    @task = RockTask.new
  end

  def create
    @task = RockTask.new(rock_task_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @rocks = RockInformation.find(params[:id])
    @task = RockTask.find(params[:id])
  end

  private
  def rock_task_params
    params.require(:rock_task).permit(:name, :rock_task_grade_id, :other, images: []).merge(user_id: current_user.id, rock_information_id: params[:rock_information_id])
  end
end
