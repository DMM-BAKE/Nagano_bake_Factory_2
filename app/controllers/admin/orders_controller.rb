class Admin::OrdersController < ApplicationController
   before_action :authenticate_admin!

  def index
    @orders = Order.all.page(params[:page])
  end

  def order_customer
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_payment = @order.total_payment - 800
    @customer = Customer.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      flash[:notice] = "注文ステータスを変更しました"
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
