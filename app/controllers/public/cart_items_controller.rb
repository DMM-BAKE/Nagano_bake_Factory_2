class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @cart_item = CartItem.new
    @order_price = 0
  end

  def new
    @cart_item = CartItem.new
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if @cart_item.save
     redirect_to public_cart_items_path
    else
     redirect_to public_items_path
    end
  end
  def edit
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
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



  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :item_count)
  end

end