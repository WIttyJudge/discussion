class Post < ApplicationRecord
  belongs_to :user

  before_validation :create_slug

  private

  def create_slug
    self.slug = generate_slug
  end

  def generate_slug
    "#{title.parameterize}-#{rand(100_000).to_s(26)}"
  end
end