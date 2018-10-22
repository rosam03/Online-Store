class LineItemsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_shop
  before_action :set_shop_orders
  before_action :set_order
  before_action :set_shop_products
  before_action :set_product
  before_action :set_order_line_items
  before_action :set_line_item, only: [:show, :update, :destroy]

  # GET shops/{shop_id}/orders/{order_id}/line_items
  def index
    payload = {
      data: payload = {
        line_items: @order_line_items
      }
    }
    render :json => payload
  end

  # GET shops/{shop_id}/orders/{order_id}/line_items/{id}
  def show
    payload = {
      data: payload = {
        line_item: @line_item
      }
    }
    render :json => payload
  end

  # POST shops/{shop_id}/orders/{order_id}/line_items
  def create
    @line_item = LineItem.new(line_item_params)
    @line_item.order = @order
    @line_item.product = @product

    if params[:quantity] == nil
      @line_item.price = @product.price
    else
      @line_item.price = @product.price * params[:quantity]
    end

    if @line_item.save
      payload = {
        data: payload = {
          line_item: @line_item
        }
      }
    else
      payload = {
        error: {
          code: :unprocessable_entity,
          message: "Could not create line_item. Verify that required parameters are supplied."
        }
      }
    end
    render :json => payload
  end

  # PATCH/PUT shops/{shop_id}/orders/{order_id}/line_items/{id}
  def update
    if @line_item.update(line_item_params)
      @line_item.product = @product

      if params[:quantity] == nil
        @line_item.price = @product.price
      else
        @line_item.price = @product.price * params[:quantity]
      end

      if @line_item.save
        payload = {
          data: payload = {
            line_item: @line_item
          }
        }
        render :json => payload
        return
      end
    end

    payload = {
      error: {
        code: :unprocessable_entity,
        message: "Could not update line_item. Verify that required parameters are supplied."
      }
    }

    render :json => payload
  end

  # DELETE shops/{shop_id}/orders/{order_id}/line_items/{id}
  def destroy
    if @line_item == nil
      payload = {
        data: nil
      }
    else
      @line_item.destroy
      if @line_item.destroyed?
        payload = {
          data: nil
        }
      else
        payload = {
          error: {
            code: :unprocessable_entity,
            message: "Could not delete line_item."
          }
        }
      end
    end
    render :json => payload
  end

  private
  
  def set_order
    @order = @shop_orders.find_by_id(params[:order_id])
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

  def set_product
    @product = @shop_products.find_by_id(params[:product_id])
  end

  def set_order_line_items
    @order_line_items = @order.line_items
  end

  def set_line_item
    @line_item = @order_line_items.find_by_id(params[:id])
    if @line_item == nil
      payload = {
        error: {
          code: :not_found,
          message: "Line Item not found."
        }
      }
      render :json => payload
    end
  end

  # whitelist parameters
  def line_item_params
    params.require(:line_item).require(:product_id)
    params.require(:line_item).permit(:quantity)
  end

end
