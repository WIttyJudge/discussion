class Post < ApplicationRecord
  resourcify

  delegate :name, to: :author, prefix: true
  delegate :username, to: :author, prefix: true

  belongs_to :author, class_name: 'User'

  has_many :replies, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :title, presence: true, length: { in: 10..100 }
  validates :body, presence: true

  before_save :capitalize_first_char_title, :create_slug

  scope :recent, -> { order(created_at: :desc) }

  private

  # takes only first character and makes it uppercase.
  def capitalize_first_char_title
    self.title = title.upcase_first
  end

  def create_slug
    self.slug = generate_slug
  end

  def generate_slug
    "#{title.parameterize}-#{rand(100_000).to_s(26)}"
  end
end
