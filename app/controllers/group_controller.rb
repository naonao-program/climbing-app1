class GroupController < ApplicationController
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

  def order_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
 end
end
