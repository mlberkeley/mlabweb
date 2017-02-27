class Project < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :members, through: :teams
  before_save { tag.downcase! }
  default_scope -> { order(:name) }
  mount_uploader :picture, PictureUploader
  mount_uploader :pdf, ProjectUploader
  validates :name, presence: true, length: { maximum: 50 }
  validates :tag, presence: true, format: { with: /(\Aindustry\z|\Aresearch\z)/i }
end
