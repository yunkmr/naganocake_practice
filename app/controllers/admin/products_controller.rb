class Admin::ProductsController < ApplicationController

  def new
    @genres = Genre.all
  end

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(params_product)
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render "new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def params_product
    params.require(:product).permit(:id, :genre_id, :name, :description, :image, :price, :sale_status)
  end

end
