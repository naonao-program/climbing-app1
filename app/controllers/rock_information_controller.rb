class RockInformationController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @rock = RockInformation.includes(:user).order('created_at DESC')
  end

  def new
    @rock = RockInformation.new
  end

  def create
    @rock = RockInformation.new(rock_information_params)
    if @rock.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @rocks = RockInformation.find(params[:id])
  end

  def edit
    @rock = RockInformation.find(params[:id])
  end

  def destroy
    @rock = RockInformation.find(params[:id])
    if current_user.id == @rock.user_id
      @rock.destroy
      redirect_to root_path
    end
  end

  private

  def rock_information_params
    params.require(:rock_information).permit(:boulder_or_lead_id, :name, :region_id, :rock_quality_id, :address,
                                             :season1_id, :season2_id, :night_id, :grade_sence_id, :people_day_id, :people_time1_id, :people_time2_id, :people_vibe_id, :other, images: []).merge(user_id: current_user.id)
  end
end
