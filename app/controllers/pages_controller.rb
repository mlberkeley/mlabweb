class PagesController < ApplicationController
  def home
    @members = Member.where("admin = ?", true)
    @projects = Project.where(current: true)
  end

  def about
    @president = Member.where("position = ?", "President")
    @members = Member.where("position != ?", "President")
  end

  def portfolio
    @projects = Project.all
  end

  def connections
  end

  def updates
    @blogposts = Blogpost.where("published = ?", true)
  end

  def legal
  end
end
