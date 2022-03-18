class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def item_params
    params.require(:item).permit(:imagem, :name, :description, :price, :item_status)
  end
end
