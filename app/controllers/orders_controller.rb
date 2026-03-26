class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @item = Item.find(params[:item_id])
    redirect_to root_path and return if current_user.id == @item.user_id || @item.order.present?

    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    redirect_to root_path and return if current_user.id == @item.user_id || @item.order.present?

    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']

      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :token).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
