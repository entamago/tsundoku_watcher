class Genre < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy

  with_options presence: true do
    validates :genre
    validates :genre_info
  end
end
