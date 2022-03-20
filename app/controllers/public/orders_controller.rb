class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @order = Order.new(order_params)
    if @order.address_option == 0
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    else if @order.address_option == 1
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else


    end


  end
  end

  def create
    @order = Order.new(order_params[:payment_method, :address_option,])

  end

  def thanks
  end

  def index
  end

  private
  def order_params
  params.require(:order).permit(:payment_method, :address_option, :postal_code, :address, :name)
  end
end

