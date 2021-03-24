class RockTaskController < ApplicationController
  def index
  end

  def new
    @task = RockTask.new
  end

  def create
  end
end
