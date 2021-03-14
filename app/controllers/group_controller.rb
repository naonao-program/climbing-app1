class GroupController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.valid?
      pay_item
      @group.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def group_params
    binding.pry
    params.merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: 500,
      card: group_params[:token],
      currency: 'jpy'
    )
  end
end
