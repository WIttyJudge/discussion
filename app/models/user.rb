class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id'
  has_many :replies

  validates :name, presence: true
  validates :username, presence: true
  validates :username, format: { without: /\s/ }
  validates :summery, length: { maximum: 200 }
end
