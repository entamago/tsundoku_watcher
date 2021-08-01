class Genre < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :genre
    validates :genre_info
  end
end
