class CartItemsController < ApplicationController
  def new
     @cart_item = Cart_item.new
  end

  def create
     @cart_item = Cart_item.new(name: params[:cart_item][:name], price: params[:cart_item][:price], qty: params[:cart_item][:qty])
    if @cart_item.valid? #validatesを実行してくれる
      flash[:notice] = 'カートに追加しました'
      @cart_item.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def destroy
    cart_item = Product.find(params[:id])
    cart_item.destroy
    redirect_to products_path
  end
end
