class User < ApplicationRecord
  rolify

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :replies
end
