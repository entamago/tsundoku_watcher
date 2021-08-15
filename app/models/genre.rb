class Genre < ApplicationRecord
  belongs_to :user
  has_many :articles, dependent: :destroy

  validates :genre,presence: true

end
