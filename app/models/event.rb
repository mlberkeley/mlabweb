class Event < ApplicationRecord
  has_and_belongs_to_many :members, -> { distinct }
  default_scope -> { order(when: :desc) }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :when, presence: true
end
