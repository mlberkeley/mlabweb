class Post < ApplicationRecord
  belongs_to :member
  validates :member_id, presence: true
  validates :content, presence: true
  validates :project, presence: true
  mount_uploader :photo, PostPhotoUploader
  default_scope -> { order(created_at: :desc) }
  validate :photo_size

  scope :recent, -> { where('created_at > ?', 1.month.ago) }
  scope :old, -> { where('created_at < ? and created_at > ?', 1.month.ago, 1.year.ago) }
  scope :ancient, -> { where('created_at < ?', 1.year.ago) }

  private

    def photo_size
      if photo.size > 5.megabytes
        errors.add(:photo, "should be less than 5MB")
      end
    end
end
