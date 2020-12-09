class Reply < ApplicationRecord
  delegate :username, to: :user, prefix: true

  belongs_to :post
  belongs_to :user

  counter_culture :post, column_name: 'replies_count'

  validates :reply, presence: true
end
