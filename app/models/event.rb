class Event < ApplicationRecord
  has_and_belongs_to_many :members, -> { distinct }
  default_scope -> { order(start: :desc) }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :start, presence: true
  validates :end, presence: true
  attr_accessor :date_range

  def all_day_event?
    self.start == self.start.midnight && self.end == self.end.midnight ? true : false
  end
end
