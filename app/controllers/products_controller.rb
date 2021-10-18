class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def new
     @product = Product.new
  end

  def create
     @product = Product.new(name: params[:product][:name], price: params[:product][:price])
    if @product.valid? #validatesを実行してくれる
      flash[:notice] = 'productを追加しました'
      @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path
  end
end
