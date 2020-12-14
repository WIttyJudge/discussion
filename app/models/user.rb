class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :replies
  has_many :bookmarks
  has_many :bookmarked_posts, through: :bookmarks,
                              source: :post, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true
  validates :username, format: { without: /\s/ }
  validates :summery, length: { maximum: 200 }
end
