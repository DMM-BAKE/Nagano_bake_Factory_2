class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(item_status: true).page(params[:page]).per(10)
    @sale_item = Item.where(item_status: true)

  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
