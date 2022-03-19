class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
  end

  def create
    @order = Order.new(params)
    @order.create
    redirect_to public_order_path(params[:id])
  end

  def thanks
  end

  def index
  end
end
