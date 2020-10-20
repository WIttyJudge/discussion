class Tag < ApplicationRecord
  has_and_belongs_to_many :posts

  validates_presence_of :name

  after_validation :name_capitalize, :create_slug

  scope :alphabetical, -> { order(name: :asc) }

  private

  def name_capitalize
    self.name = name.capitalize
  end

  def create_slug
    self.slug = name.parameterize
  end
end