class RockTaskController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @task = RockTask.new
  end

  def create
    @task = RockTask.new(rock_task_params)
    if @task.save
      redirect_to "/rock_information/#{@task.rock_information_id}"
    else
      render :new
    end
  end

  def edit
    @task = RockTask.find(params[:id])
  end

  def update
    @task = RockTask.find(params[:rock_information_id])
    if @task.update(rock_task_params)
      redirect_to "/rock_information/#{@task.rock_information_id}"
    else
      render :edit
    end
  end

  def show
    @rock = RockInformation.find(params[:rock_information_id])
    @task = RockTask.find(params[:id])
  end



  private
  def rock_task_params
    params.require(:rock_task).permit(:name, :rock_task_grade_id, :youtube_url, :other, images: []).merge(user_id: current_user.id, rock_information_id: params[:rock_information_id])
  end
end
