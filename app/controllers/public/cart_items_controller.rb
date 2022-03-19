class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_item = CartItem.new
  end

  def new
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(params[:id])
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def update
    @cart_item.update(params)
    redirect_to public_cart_items_path

  end

  def destroy
    @cart_item.destroy
    redirect_to public_cart_items_paht
  end

  def all_destroy
    @cart_items = current_customer.cart_items
    @cart_items.destroy
    redirect_to public_cart_items_paht
  end



  # private

  # def cart_item_params
  #   params.require(:cart_items).permit(:customer_id, :item_count)
  # end

end