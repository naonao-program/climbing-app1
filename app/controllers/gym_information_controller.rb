class GymInformationController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index; end

  def new
    @gym = GymInformation.new
  end

  def create
    @gym = GymInformation.new(gym_information_params)
    if @gym.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def gym_information_params
    params.require(:gym_information).permit(:boulder_or_lead_id, :name, :region_id, :address, :grade_sence_id,
                                            :people_day_id, :people_time1_id, :people_time2_id, :people_vibe_id, :clerk_vibe_id, :other, images: []).merge(user_id: current_user.id)
  end
end
