class ResponsesController < ApplicationController
  def create
    @response = Response.new(response_params)
    @response.user = current_user
    authorize @response
  end

  private

  def response_params
    params.require(:response).permit(:choice)
  end
end
