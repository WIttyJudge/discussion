class Tag < ApplicationRecord
  HEX_COLOR_REGEXP = /\A#?(?:[A-F0-9]{3}){1,2}\z/i.freeze

  has_and_belongs_to_many :posts

  validates :name, :guideline, :about, presence: true
  # validates :name, uniqueness: { case_sensitive: false }
  validates :text_color_hex, format: { with: HEX_COLOR_REGEXP, allow_nil: true }
  validates :bg_color_hex, format: { with: HEX_COLOR_REGEXP, allow_nil: true,
                                     message: 'Background color is invalid' }

  before_save :name_capitalize, :create_slug

  scope :alphabetical, -> { order(name: :asc) }

  private

  def name_capitalize
    self.name = name.capitalize
  end

  def create_slug
    self.slug = name.parameterize
  end
end
