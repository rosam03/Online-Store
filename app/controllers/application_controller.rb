class ApplicationController < ActionController::Base

  private

  rescue_from(ActionController::ParameterMissing) do |parameter_missing_exception|
    payload = {
      error: {
        code: :unprocessable_entity,
        message: "Required parameters are missing."
      }
    }
    render :json => payload
  end

  # the following are used for children of shop

  def set_shop
    @shop = Shop.find_by_id(params[:shop_id])
    if @shop == nil
      payload = {
        error: {
          code: :not_found,
          message: "Shop not found."
        }
      }
      render :json => payload
    end
  end

  def set_shop_orders
    @shop_orders = @shop.orders.sorted
    # update order totals based on line items
    @shop_orders.each { |order|
      order.total = order.line_items.sum(:price)
      order.save
    }
  end

  def set_shop_products
    @shop_products = @shop.products
  end

end
