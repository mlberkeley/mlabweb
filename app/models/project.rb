class Project < ApplicationRecord
  has_and_belongs_to_many :members
  has_many :teams
  has_many :members, through: :teams
  before_save { tag.downcase! }
  default_scope -> { order(:name) }
  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: { maximum: 50 }
  validates :tag, presence: true, format: { with: /(\Aindustry\z|\Aresearch\z)/i }
end
