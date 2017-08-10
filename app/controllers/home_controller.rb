class HomeController < ApplicationController
  def home
    @president = Member.where("position = ?", "President").first
    @execs = Member.confirmed.where(["exec = ? and position != ?", true, "President"])
  end
end
