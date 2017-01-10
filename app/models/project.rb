class Project < ApplicationRecord
  before_save { tag.downcase! }
  default_scope -> { order(:name) }
  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: { maximum: 50 }
  validates :tag, presence: true, format: { with: /(\Aindustry\z|\Aresearch\z)/i }
end
