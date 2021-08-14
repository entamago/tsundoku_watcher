class Article < ApplicationRecord
  belongs_to :user
  belongs_to :genre

  with_options presence: true do
    validates :title,   length: {maximum: 20}
    validates :article, length: {maximum: 200}
  end

  def self.search(keyword)
    where(["title like? OR article like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
