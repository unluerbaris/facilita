class ResponsesController < ApplicationController

  def create
    # @choices = Choice.where
    @response = Response.new(response_params)
    @response.user = current_user
    authorize @response
    if @response.save
      redirect_to event_path(@response.choice.poll.event)
    else
      render "events/show"
    end
  end

  private

  def response_params
    params.require(:response).permit(:choice_id, :answer)
  end
end
