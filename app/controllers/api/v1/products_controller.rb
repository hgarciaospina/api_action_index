class Api::V1::ProductsController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @products = Product.all
  end

  def create
      @product = Product.new(product_params)

      if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
  end

private
 # Use callbacks to share common setup or constraints between actions.
  def product_params
      params.require(:product).permit(:name, :price)
  end

end
