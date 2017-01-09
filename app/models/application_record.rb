class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
