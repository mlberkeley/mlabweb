class UpdatesController < ApplicationController
  def events
    @mlab_graph = get_mlab_graph
    @events = @mlab_graph.get_object("v2.8/1701763616733787/events", {fields: ['name', 'start_time', 'place', 'description', 'cover', 'attending_count', 'interested_count', 'id']}).select { |hash| hash["start_time"] > Time.now.beginning_of_day }
    @feed = @mlab_graph.get_object("v2.8/1701763616733787/feed", {fields: ['story', 'created_time', 'message', 'full_picture', 'link']})
    @recent = @mlab_graph.get_object("v2.8/1701763616733787/events", {fields: ['name', 'start_time', 'place', 'description', 'cover', 'attending_count', 'interested_count', 'id']}).select { |hash| hash["start_time"] < Time.now.beginning_of_day }.first
  end

  def subscribe
  end

  def timeline
    @feed = Post.all
  end

  private

    def get_mlab_graph
      oauth = Koala::Facebook::OAuth.new(ENV["FB_APP_ID"], ENV["FB_APP_SECRET"])
      graph = Koala::Facebook::API.new(ENV["FB_USER_ACCESS_TOKEN"])
      token = graph.get_object("me/accounts")[1]['access_token']
      return Koala::Facebook::API.new(token)
    end
end
