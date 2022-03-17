class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def quit
  end

  def edit
    @customer = current_customer
    if @customer != current_customer
    redirect_to public_customer_path(current_customer)
    end
  end
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to public_customer_path(@customer.id), notice: "会員の情報が更新されました"
    else
      render edit_public_customer_path
    end
  end

　private
  def customer_params
    params.require(:customer)
    .permit(:last_name,
    :first_name,
    :last_name_kana,
    :first_name_kana,
    :email, :postal_code,
    :address, :phone_number,
    :is_deleted)
  end
end
