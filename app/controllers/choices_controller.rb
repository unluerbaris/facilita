class ChoicesController < ApplicationController
  before_action :set_poll, only: [:create]

  def create
    @choice = Choice.new(choice_params)
    authorize @choice
    @choice.poll = @poll
    if @choice.save
    end
  end

  private

  def choice_params
    params.require(:choice)
  end

  def set_poll
    @poll = Poll.find(params[:poll_id])
  end
end
