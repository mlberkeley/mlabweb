class EventsController < ApplicationController
  before_action :logged_in_member, only: [:all, :attendance, :new2, :create2, :new, :create]
  before_action :officer_member, only: [:all, :new2, :create2]
  before_action :set_event, only: [:destroy, :show, :edit, :update]

  skip_before_action :verify_authenticity_token, only: [:make_event, :make_event_gcal, :call_roll, :finish]


  def all
    @mlab_graph = get_mlab_graph
    @fb_events = @mlab_graph.get_object("v2.8/1701763616733787/events").select { |hash| hash["start_time"] > Time.now.beginning_of_day }
    # @gcal_events = get_gcal_events
    @saved_events = Event.all
    @current = Event.where(live: true).first
  end

  def past
    @mlab_graph = get_mlab_graph
    @events = @mlab_graph.get_object("v2.8/1701763616733787/events").select { |hash| hash["start_time"] < Time.now.beginning_of_day }
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

  def make_event_gcal
    toSave = Event.new(name: params["name"], start: DateTime.parse(params["start"][0...18]), end: DateTime.parse(params["end"][0...18]))
    if toSave.save
      flash[:success] = "Gcal event successfully saved to database"
      redirect_to all_events_path
    else
      flash[:warning] = "Duplicate event error"
      redirect_to all_events_path
    end
  end

  #fullCalendar methods
  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.save
  end

  def update
    @event.update(event_params)
  end

  private

    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :live, :place, :start, :end, :description, :date_range, :color)
    end
end
