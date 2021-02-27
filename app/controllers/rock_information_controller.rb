class RockInformationController < ApplicationController
  def index
  end

  def new
    @rock = RockInformation.new
  end

  def create
  end
end
