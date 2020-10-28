class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id'
  has_many :replies

  validates :username, presence: true
end
