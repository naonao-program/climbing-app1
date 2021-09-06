class RockInformationController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update]
  before_action :set_rock_information, only: %i[show edit update destroy]
  def index
    @rock = RockInformation.includes(:user).order('created_at DESC')
  end

  def new
    @rock = RockInformation.new
  end

  def create
    @rock = RockInformation.new(rock_information_params)
    if @rock.save
      redirect_to rock_information_path(@rock.id)
    else
      render :new
    end
  end

  def show
    @task = RockTask.new
    @tasks = @rock.rock_tasks.includes(:user)
    @comment = RockComment.new
    @comments = @rock.rock_comments.includes(:user)
  end

  def edit; end

  def update
    if @rock.update(rock_information_params)
      redirect_to rock_information_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @rock.user_id
      @rock.destroy
      redirect_to rock_information_index_path
    end
  end

  def search
    @rock = RockInformation.search(params[:keyword])
  end

  private

  def rock_information_params
    params.require(:rock_information).permit(:boulder_or_lead_id, :name, :region_id, :rock_quality_id, :address,
                                             :season1_id, :season2_id, :night_id, :grade_sence_id, :people_day_id, :people_time1_id, :people_time2_id, :people_vibe_id, :other, images: []).merge(user_id: current_user.id)
  end

  def set_rock_information
    @rock = RockInformation.find(params[:id])
  end
end
