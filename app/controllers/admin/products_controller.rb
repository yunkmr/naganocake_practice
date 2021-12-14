class Admin::ProductsController < ApplicationController

  def new
    @genres = Genre.all
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(params_product)
    @product.save
    redirect_to product_path(@product)
  end

  def show
  end

  private

  def params_product
    params.require(:product).permit(:genre_id, :name, :description, :image, :price, :sale_status)
  end

end
