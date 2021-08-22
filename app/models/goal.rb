class Goal < ApplicationRecord
  with_options presence: true do
    validates :short_tern_goal
    validates :time_limit
  end
  validates :achievement, inclusion: { in: [true, false] }

  belongs_to :user
end
