class RockTaskController < ApplicationController
  def index
  end

  def new
    @task = RockTask.new
  end

  def create
    @task = RockTask.new(rock_task_params)
    if @task.save
      redirect_to rock_information_path
    else
      render :new
    end
  end
end
