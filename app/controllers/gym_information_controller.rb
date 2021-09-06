class GymInformationController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @gyms = GymInformation.includes(:user).order('created_at DESC')
  end

  def new
    @gym = GymInformation.new
  end

  def create
    @gym = GymInformation.new(gym_information_params)
    if @gym.save
      redirect_to gym_information_path(@gym.id), notice: '成功しました'
    else
      render :new
    end
  end

  def show
    @gym = GymInformation.all
    @gyms = GymInformation.find(params[:id])
    @comment = GymComment.new
    @comments = @gyms.gym_comments.includes(:user)
  end

  def edit
    @gym = GymInformation.find(params[:id])
  end

  def update
    @gym = GymInformation.find(params[:id])
    if @gym.update(gym_information_params)
      redirect_to gym_information_path
    else
      render :edit
    end
  end

  def destroy
    @gym = GymInformation.find(params[:id])
    if current_user.id == @gym.user_id
      @gym.destroy
      redirect_to gym_information_path
    end
  end

  def search
    @gyms = GymInformation.search(params[:keyword])
  end

  private

  def gym_information_params
    params.require(:gym_information).permit(:boulder_or_lead_id, :name, :region_id, :address, :grade_sence_id, :business_hours1_id, :business_hours2_id,
                                            :people_day_id, :people_time1_id, :people_time2_id, :people_vibe_id, :clerk_vibe_id, :gym_url, :gym_sns_url, :other, images: []).merge(user_id: current_user.id)
  end
end
