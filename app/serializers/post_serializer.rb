class PostSerializer < ApplicationSerializer
  attributes :title, :body, :created_at

  has_many :replies
  has_many :tags
end
