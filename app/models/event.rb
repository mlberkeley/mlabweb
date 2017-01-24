class Event < ApplicationRecord
  has_and_belongs_to_many :members, -> { distinct }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
