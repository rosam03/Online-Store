class ProductsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_shop
  before_action :set_shop_products
  before_action :set_product, only: [:show, :update, :destroy]

  # GET shops/products/{shop_id}/products
  def index
    payload = {
      data: payload = {
        products: @shop_products
      }
    }
    render :json => payload
  end

  # GET shops/{shop_id}/products/{id}
  def show
    payload = {
      data: payload = {
        product: @product
      }
    }
    render :json => payload
  end

  # POST shops/{shop_id}/products
  def create
    @product = Product.new(product_params)
    @product.shop = @shop
    if @product.save
      payload = {
        data: payload = {
          product: @product
        }
      }
    else
      payload = {
        error: {
          code: :unprocessable_entity,
          message: "Could not create product. Verify that required parameters are supplied."
        }
      }
    end
    render :json => payload
  end

  # PATCH/PUT shops/{shop_id}/products/{id}
  def update
    if @product.update(product_params)
      payload = {
        data: payload = {
          product: @product
        }
      }
    else
      payload = {
        error: {
          code: :unprocessable_entity,
          message: "Could not update product. Verify that required parameters are supplied."
        }
      }
    end
    render :json => payload
  end

  # DELETE shops/{shop_id}/products/{id}
  def destroy
    if @product == nil
      payload = {
        data: nil
      }
    else
      @product.destroy
      if @product.destroyed?
        payload = {
          data: nil
        }
      else
        payload = {
          error: {
            code: :unprocessable_entity,
            message: "Could not delete product."
          }
        }
      end
    end
    render :json => payload
  end

  private

  def set_product
    @product = @shop_products.find_by_id(params[:id])
    if @product == nil
      payload = {
        error: {
          code: :not_found,
          message: "Product not found."
        }
      }
      render :json => payload
    end
  end

  # whitelist parameters
  def product_params
    params.require(:product).permit(:name, :price)
  end

end
