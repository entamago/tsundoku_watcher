class Genre < ApplicationRecord
  belongs_to :user
  has_many :articles

  with_options presence: true do
    validates :genre
    validates :genre_info
  end
end
