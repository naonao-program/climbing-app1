class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to group_index_path
    else
      render 'new'
    end
  end

  private

  def order_params
    params.require(:order).permit(:price).merge(user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
