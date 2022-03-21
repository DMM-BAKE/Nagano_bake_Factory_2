class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
      @order_price = 0
      @cart_items = current_customer.cart_items
      @order_detail = OrderDetail.new
      @order = Order.new
      @order.payment_method = params[:order][:payment_method]
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]


    end



  end

  def create
    @order = Order.new(order_params)
    @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.order_id = @order.id
        @order_detail.item_id = cart_item.item.id
        @order_detail.order_count = cart_item.item_count
        @order_detail.order_price = cart_item.item.add_tax_price
        @order_detail.save

  end
    current_customer.cart_items.destroy_all
    redirect_to public_thanks_path



    # @order = Order.new(order_params)
    # @order.save
    # redirect_to public_order_details_path
  end

  def thanks

  end
  def show
    @orders = current_customer.orders

  end
    # ためし


  def index
  end


  private

  private
def order_params
  params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :payment_method, :total_payment, :customer_id)
  # params.require(:order).permit(:payment_method, :select_address, :postal_code, :address, :name)
end




end

