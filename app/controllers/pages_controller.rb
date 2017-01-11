class PagesController < ApplicationController
  def home
    @members = Member.where("officer = ?", true)
    @projects = Project.where(current: true)
  end

  def about
    @president = Member.where("position = ?", "President")
    @members = Member.where("position != ?", "President")
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
  end

  def legal
  end
end
