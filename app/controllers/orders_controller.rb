class OrdersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_shop
  before_action :set_shop_orders
  before_action :set_order, only: [:show, :update, :destroy]

  # GET shops/orders/{shop_id}/orders
  def index
    payload = {
      data: payload = {
        orders: @shop_orders
      }
    }
    render :json => payload
  end

  # GET shops/{shop_id}/orders/{id}
  def show
    payload = {
      data: payload = {
        order: @order
      }
    }
    render :json => payload
  end

  # POST shops/{shop_id}/orders
  def create
    @order = Order.new(order_params)
    # @order.customer_name = params[:customer_name]
    @order.shop = @shop
    if @order.save
      payload = {
        data: payload = {
          order: @order
        }
      }
    else
      payload = {
        error: {
          code: :unprocessable_entity,
          message: "Could not create order. Verify that required parameters are supplied."
        }
      }
    end
    render :json => payload
  end

  # PATCH/PUT shops/{shop_id}/orders/{id}
  def update
    if @order.update(order_params)
      payload = {
        data: payload = {
          order: @order
        }
      }
    else
      payload = {
        error: {
          code: :unprocessable_entity,
          message: "Could not update order. Verify that required parameters are supplied."
        }
      }
    end
    render :json => payload
  end

  # DELETE shops/{shop_id}/orders/{id}
  def destroy
    if @order == nil
      payload = {
        data: nil
      }
    else
      @order.destroy
      if @order.destroyed?
        payload = {
          data: nil
        }
      else
        payload = {
          error: {
            code: :unprocessable_entity,
            message: "Could not delete order."
          }
        }
      end
    end
    render :json => payload
  end

  private

  def set_order
    @order = @shop_orders.find_by_id(params[:id])
    if @order == nil
      payload = {
        error: {
          code: :not_found,
          message: "Order not found."
        }
      }
      render :json => payload
    end
  end

  # whitelist parameters
  def order_params
    params.require(:order).require(:customer_name)
    params.require(:order).permit(:total, :customer_name)
  end

end
