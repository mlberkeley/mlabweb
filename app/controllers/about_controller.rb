class AboutController < ApplicationController

  def advisors
  end

  def home

  end

  def team
    @president = Member.where("position = ?", "President")
    @execs = Member.confirmed.where(["exec = ? and position != ?", true, "President"])
    @officers = Member.confirmed.where(officer: true)
    @members = Member.confirmed.where(exec: false, officer: false).where.not(lname:"@ Berkeley")
  end

  def nmo
  end

  private
end
