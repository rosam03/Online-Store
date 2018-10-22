class ErrorsController < ApplicationController

  protect_from_forgery with: :null_session

  def not_found
    payload = {
      error: {
          code: :not_found,
          message: "Path not found."
        }
    }
  render :json => payload
  end

end
