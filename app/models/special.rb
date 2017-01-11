class Special < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true
end
