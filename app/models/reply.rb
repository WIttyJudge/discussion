class Reply < ApplicationRecord
  delegate :username, to: :user, prefix: true

  belongs_to :post
  belongs_to :user

  validates :reply, presence: true
end
