class Reply < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :reply, presence: true
end