class Admin::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]
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
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
       flash[:notice] = "注文ステータスを変更しました"
      if @order.order_status == "paid_up"
        @order_details.each do |order_detail|
         order_detail.making_status = "waiting_production"
         order_detail.save
        end
      end
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_status)
  end
end
