class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @order_detail = OrderdDetail.find_by(item_id: params[:id])
  end
end
