class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, length: {maximum: 10, message: "10文字以内で入力してください"}
    validates :purpose, length: {maximum: 30, message: "30文字以内で入力してください"}
  end

  has_many :genres
  has_many :articles
  has_many :gorls

  def self.guest
    find_or_create_by(email: "testtest@test.com") do |user|
      user.password = "test123"
    end
  end
end
