class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_user.id)
  end

  def new
    @cart_item = CartItem.new

  def create
    @cart_item = CartItem.new(params[:id])
    @cart_item.customer_id = current_user.id
    @cart_item.save
    redirect_to public_cart_items_paht
  end

  def update
  end

  def destroy
  end

  def all_destroy
  end

end
