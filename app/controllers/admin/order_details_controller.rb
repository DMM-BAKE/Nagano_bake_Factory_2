class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    if @order_detail.update(order_detail_params)
      flash[:notice] = "製作ステータスを変更しました"
      if params[:order_detail][:making_status] == "in_production"
        @order_detail.order.order_status = "under_production"
        @order.save
      elsif @order.order_details.count == @order.order_details.where(making_status: "production_completed").count
        @order.order_status = "preparing"
        @order.save
      end
      redirect_to admin_order_path(@order_detail.order)
    else
      render :show
    end
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
