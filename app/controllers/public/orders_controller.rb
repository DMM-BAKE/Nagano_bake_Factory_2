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

    if @order.save(order_params)
      redirect_to public_cart_items_all_destroy_path
    else
      render 'confirm'
    end
  end

  def thanks

  end

  def index
  end


  private

  private
def order_params
  params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :payment_method, :total_payment, :customer_id)
  # params.require(:order).permit(:payment_method, :select_address, :postal_code, :address, :name)
end




end

