class Post < ApplicationRecord
  resourcify

  delegate :username, to: :author, prefix: true

  belongs_to :author, class_name: 'User'

  has_many :replies, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :title, presence: true, length: { in: 10..128 }
  validates :body, presence: true

  before_save :create_slug

  scope :recent, -> { order(created_at: :desc) }

  private

  def create_slug
    self.slug = generate_slug
  end

  def generate_slug
    "#{title.parameterize}-#{rand(100_000).to_s(26)}"
  end
end