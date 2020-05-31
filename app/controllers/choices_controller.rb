# class ChoicesController < ApplicationController

#   def new
#     @choice = Choice.new
#     authorize @choice
#     @event = @poll.event
#   end

#   def create
#     raise
#     @choice = Choice.new(choice_params)
#     authorize @choice
#     unless @choice.save
#       flash[:alert] = "Something went wrong!!!"
#     end
#   end

#   private

#   def choice_params
#     params.require(:choice).permit(:answer)
#   end
# end
