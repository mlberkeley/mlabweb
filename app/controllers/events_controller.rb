class EventsController < ApplicationController

  def index
    @mlab_graph = get_mlab_graph
    @events = @mlab_graph.get_object("v2.8/1701763616733787/events")
  end

  def past
    @mlab_graph = get_mlab_graph
    @events = @mlab_graph.get_object("v2.8/1701763616733787/events").select { |hash| hash["start_time"] < Time.now.beginning_of_day }
  end
end
