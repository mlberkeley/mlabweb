class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  default_scope -> { order(:lname) }
  mount_uploader :picture, MemberPicUploader
  before_save { email.downcase! }
  validates :fname, presence: true, length: { maximum: 50 }
  validates :lname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@ml\.berkeley\.edu\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  scope :confirmed, -> { where.not(confirmed_at: nil) }
  scope :online, lambda{ where("updated_at > ?", 10.minutes.ago) }

  has_many :associations, dependent: :destroy
  has_many :projects, through: :associations
  has_many :posts, dependent: :destroy

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_picture

  def crop_picture
    picture.recreate_versions! if crop_x.present?
  end

  def full_name
    fname + " " + lname
  end

  def last_first_name
    lname + ", " + fname
  end

  def online?
    updated_at > 10.minutes.ago
  end
end
