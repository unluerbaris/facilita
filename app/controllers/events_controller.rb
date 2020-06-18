require 'json'
require 'open-uri'
require 'nokogiri'

class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    authorize @event
    @new_message = Message.new
    @new_question = Question.new
    @new_poll = Poll.new
    @new_poll.choices.build
    @tab = params[:tab] || "comment"
  end

  def new
    @event = Event.new
    url = 'https://api.meetup.com/Le-Wagon-Tokyo-Coding-Station/events?&sign=true&photo-host=public&page=20'
    events_serialized = open(url).read
    @events = JSON.parse(events_serialized)
    authorize Event
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def summary
    @event = Event.find(params[:event_id])
    authorize @event
    @audiences = Audience.where(event: current_user.events).joins(:user).where.not(users: {first_name: "guest", gender: nil, occupation: nil})
    @messages = Message.where(event: current_user.events)
    @questions = Question.where(event: current_user.events)
  end

  def edit
    @event = Event.find(params[:id])
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    authorize @event
    @event.save
    redirect_to @event
  end

  # def meetup
  #   @event = Event.new
  #   url = 'https://api.meetup.com/Le-Wagon-Tokyo-Coding-Station/events?&sign=true&photo-host=public&page=20'
  #   events_serialized = open(url).read
  #   @events = JSON.parse(events_serialized)
  #   authorize Event
  # end

  def create_meetup
    @event = Event.new(event_params)
    authorize @event
    @event.user = current_or_guest_user
    @event.title = params["event"]["name"]
    @event.description =  Nokogiri::HTML(params["event"]["description"]).text.strip
    @event.start_time = DateTime.parse(params["event"]["local_date"] + " " + params["event"]["local_time"]).change(:offset => "+0900")
    @event.end_time = DateTime.parse(params["event"]["local_date"] + " " + params["event"]["local_time"]).change(:offset => "+0700")
    @event.location = params["event"]["venue"]["name"]

    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_time, :end_time, :photo, :location)
  end
end
