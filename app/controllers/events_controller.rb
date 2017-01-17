class EventsController < ApplicationController
  before_action :logged_in_member, only: [:index]
  before_action :officer_member, only: :index

  def index
    @mlab_graph = get_mlab_graph
    @events = @mlab_graph.get_object("v2.8/1701763616733787/events")
    @current = Event.where(live: true).first
  end

  def past
    @mlab_graph = get_mlab_graph
    @events = @mlab_graph.get_object("v2.8/1701763616733787/events").select { |hash| hash["start_time"] < Time.now.beginning_of_day }
  end

  # AJAX methods for accessing model methods
  def call_roll
    if !Event.where(live: true).empty?
      flash[:warning] = "Already taking roll for an event"
      redirect_to events_path
    else
      mlab_graph = get_mlab_graph
      event = mlab_graph.get_object("v2.8/1701763616733787/events").select { |hash| hash["id"] == params["e_id"] }.first
      Event.new(name: event["name"], live: true, latitude: event["place"]["location"]["latitude"], longitude: event["place"]["location"]["longitude"]).save
    end
  end

  def finish
    Event.where(live: true).first.update_attribute(:live, false)
  end
end
