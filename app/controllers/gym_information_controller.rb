class GymInformationController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_region_all, only: [:index, :search]

  def index
    @gyms = GymInformation.includes(:user).order('created_at DESC')
  end

  def new
    @gym = GymInformation.new
  end

  def create
    @gym = GymInformation.new(gym_information_params)
    if @gym.save
      redirect_to gym_information_path(@gym.id), notice: '投稿が完了しました'
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
      flash[:notice] = '投稿が更新されました'
      redirect_to gym_information_path
    else
      render :edit
    end
  end

  def destroy
    @gym = GymInformation.find(params[:id])
    if current_user.id == @gym.user_id
      @gym.destroy
      flash[:notice] = '投稿が削除されました'
      redirect_to gym_information_index_path
    end
  end

  def search
    @gyms = GymInformation.search(params[:keyword]).where(region_id: params[:region_id])

  end

  private

  def gym_information_params
    params.require(:gym_information).permit(:boulder_or_lead_id, :name, :region_id, :address, :grade_sence_id, :business_hours1_id, :business_hours2_id,
                                            :people_day_id, :people_time1_id, :people_time2_id, :people_vibe_id, :clerk_vibe_id, :gym_url, :gym_sns_url, :other, images: []).merge(user_id: current_user.id)
  end

  def set_region_all
    @region =Region.all
  end
end
