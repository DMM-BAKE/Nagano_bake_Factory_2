class OrderDetailsController < ApplicationController
  def create
    if order_detail.save(order_details_params)
      redirect_to public_cart_items_all_destroy_path
    else
      render 'confirm'
    end
  end

  def index
  end

  def show
  end
  private
  def order_details_params
    params.require(:order_detail).permit(:item_id, :order_id, :order_price, :order_count)
  end
end
