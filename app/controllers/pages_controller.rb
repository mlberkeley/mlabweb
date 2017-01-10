class PagesController < ApplicationController
  def home
    @members = Member.all
    @projects = Project.where(current: true).all
  end

  def about
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
