class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
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
      if params[:order][:postal_code] == "" || params[:order][:address] == "" || params[:order][:name] == ""
        redirect_to new_public_order_path, notice: "配送先情報を入力して下さい"
      else
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
      end
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
  end

  def thanks
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = current_customer.orders.page(params[:page]).per(5)
  end

  private

def order_params
  params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :payment_method, :total_payment, :customer_id)

end

end

