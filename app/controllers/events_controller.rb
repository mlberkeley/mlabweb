class EventsController < ApplicationController
  before_action :logged_in_member, only: [:index, :attendance, :new, :create]
  before_action :officer_member, only: [:index, :new, :create]
  before_action :set_event, only: [:destroy]

  def all
    @mlab_graph = get_mlab_graph
    @fb_events = @mlab_graph.get_object("v2.8/1701763616733787/events").select { |hash| hash["start_time"] > Time.now.beginning_of_day }
    @saved_events = Event.all
    @current = Event.where(live: true).first
  end

  def past
    @mlab_graph = get_mlab_graph
    @events = @mlab_graph.get_object("v2.8/1701763616733787/events").select { |hash| hash["start_time"] < Time.now.beginning_of_day }
    debugger
  end

  def attendance
    @events = Event.all
    @freshmen = Member.where(grade: "Freshman")
  end

  def new2
    @event = Event.new
  end

  def create2
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "Event successfully created"
      redirect_to all_events_path
    else
      if @event.errors.messages[:start] or @event.errors.messages[:end]
        @event.errors.messages[:start].append("time example: Mar 24, 2015")
      end
      render 'new'
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "Event destroyed"
    redirect_to all_events_path
  end

  # AJAX methods for accessing model methods
  def call_roll
    if !Event.where(live: true).empty?
      flash[:warning] = "Already taking roll for an event"
      redirect_to all_events_path
    else
      Event.where(id: params["e_id"]).first.update_attribute(:live, true)
      flash[:info] = "Now taking roll"
      redirect_to all_events_path
    end
  end

  def finish
    Event.where(live: true).first.update_attribute(:live, false)
    flash[:info] = "Attendance is now closed"
    redirect_to all_events_path
  end

  def make_event
    mlab_graph = get_mlab_graph
    event = mlab_graph.get_object("v2.8/1701763616733787/events").select { |hash| hash["id"] == params["e_id"] }.first
    toSave = Event.new(name: event["name"], live: false, latitude: event["place"]["location"]["latitude"], longitude: event["place"]["location"]["longitude"], description: event["description"], place: event["place"]["name"], start: event["start_time"], end: event["end_time"])
    if toSave.save
      flash[:success] = "Facebook event successfully saved to database"
      redirect_to all_events_path
    else
      flash[:warning] = "Duplicate event error"
      redirect_to all_events_path
    end
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :live, :place, :start, :end, :description, :date_range, :color)
    end
end
