class PagesController < ApplicationController
  def home
    @members = Member.where("exec = ?", true)
    @projects = Project.where(current: true)
  end

  def about
    @president = Member.where("position = ?", "President")
    @execs = Member.where(["exec = ? and position != ? and activated = ?", true, "President", true])
    @officers = Member.where(officer: true, activated: true)
    @members = Member.where(exec: false, officer: false, activated: true)
    @aboutmlab = Special.where(title: "About ML@B")
    @nmos = Special.where(tag: "nmo")
  end

  def portfolio
    @projects = Project.all
  end

  def connections
  end

  def updates
    @blogposts = Blogpost.where("published = ?", true)
    @mlab_graph = get_mlab_graph
    @events = @mlab_graph.get_object("v2.8/1701763616733787/events").select { |hash| hash["start_time"] > Time.now.beginning_of_day }
    @feed = @mlab_graph.get_connection('me', 'feed')
  end
end
