class ShopsController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_shop, only: [:show, :update, :destroy]

  # GET /shops
  def index
    @shops = Shop.all
    payload = {
      data: payload = {
        shops: @shops
      }
    }
    render :json => payload
  end

  # GET /shops/{id}
  def show
    payload = {
      data: payload = {
        shop: @shop
      }
    }
    render :json => payload
  end

  # POST /shops
  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      payload = {
        data: payload = {
          shop: @shop
        }
      }
    else
      payload = {
        error: {
          code: :unprocessable_entity,
          message: "Could not create shop. Verify that required parameters are supplied."
        }
      }
    end
    render :json => payload
  end

  # PATCH/PUT /shops/{id}
  def update
    if @shop.update(shop_params)
      payload = {
        data: payload = {
          shop: @shop
        }
      }
    else
      payload = {
        error: {
          code: :unprocessable_entity,
          message: "Could not update shop. Verify that required parameters are supplied."
        }
      }
    end
    render :json => payload
  end

  # DELETE /shops/{id}
  def destroy
    if @shop == nil
      payload = {
        data: nil
      }
    else
      @shop.destroy
      if @shop.destroyed?
        payload = {
          data: nil
        }
      else
        payload = {
          error: {
            code: :unprocessable_entity,
            message: "Could not delete shop."
          }
        }
      end
    end
    render :json => payload
  end

  private

  def set_shop
    @shop = Shop.find_by_id(params[:id])
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

  # whitelist parameters
  def shop_params
    params.require(:shop).permit(:name, :email)
  end

end
