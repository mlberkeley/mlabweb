class Team < ApplicationRecord
  belongs_to :member
  belongs_to :project
end
