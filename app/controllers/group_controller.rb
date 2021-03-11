class GroupController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new
    if @group.valid?
      pay_item
      @group.save
      redirect_to :index
    else
      render :new
    end
  end

  private

  def pay_item
    Payjp.api_key = ENV['sk_test_3aed90f3849053e399172023']
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_form_params[:token],
      currency: 'jpy'
    )
  end
end
