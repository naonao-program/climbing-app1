class GymInformationController < ApplicationController
  def index
  end

  def new
    @gym = GymInformation.new
  end

  def create
    @gym = GymInformation.new(gym_information_params)

  end
end
