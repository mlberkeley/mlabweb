class PagesController < ApplicationController
  def home
    @members = Member.all
  end

  def about
  end

  def portfolio
  end

  def connections
  end

  def updates
  end

  def legal
  end
end
