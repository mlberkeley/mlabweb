class Project < ApplicationRecord
  has_many :associations, dependent: :destroy
  has_many :members, through: :associations
  has_many :posts, through: :members
  before_save { tag.downcase! }
  before_save { semester.downcase! }
  default_scope -> { order(:name) }
  mount_uploader :picture, ProjectPicUploader
  mount_uploader :background, ProjectBgUploader
  validates :name, presence: true, length: { maximum: 50 }
  validates :tag, presence: true, format: { with: /(\Aindustry\z|\Aresearch\z)/i }

  scope :current, -> { where(semester: "fall", year: 2017) }
  scope :past, -> { where(["semester != ? or year != ?", "fall", 2017]) }

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_background

  def crop_background
    background.recreate_versions! if crop_x.present?
  end

  def full_term
    semester + " " + year
  end

  def current?
    semester == "fall" and year == 2017
  end
end
