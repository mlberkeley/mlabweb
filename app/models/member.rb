class Member < ApplicationRecord
  has_many :blogposts, dependent: :destroy
  has_many :teams, dependent: :destroy
  has_many :projects, through: :teams
  attr_accessor :remember_token, :activation_token, :reset_token
  default_scope -> { order(:name) }
  mount_uploader :picture, PictureUploader
  before_save { email.downcase! }
  before_create :create_activation_digest
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@ml\.berkeley\.edu\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validate :picture_size

  # Returns hash digest of a string
  def Member.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns random base64 token of length 22
  def Member.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Member.new_token
    update_attribute(:remember_digest, Member.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  def send_activation_email
    MemberMailer.account_activation(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = Member.new_token
    update_columns(reset_digest: Member.digest(reset_token), reset_sent_at: Time.zone.now)
  end

  def send_password_reset_email
    MemberMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  # Joins a project team
  def join(project)
    projects << project
  end

  # Leaves a project team
  def leave(project)
    projects.delete(project)
  end

  def devoted?(project)
    projects.include?(project)
  end

  private

    def create_activation_digest
      self.activation_token = Member.new_token
      self.activation_digest = Member.digest(activation_token)
    end
end
