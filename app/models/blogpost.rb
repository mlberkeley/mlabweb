class Blogpost < ApplicationRecord
  belongs_to :member
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, ImageUploader
  validates :member_id, presence: true
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 50000 }
  validate :picture_size

  # Feed of published blogposts
  def blog
    Blogpost.where("published = ?", true)
  end
end
