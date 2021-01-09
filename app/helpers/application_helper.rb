require 'redcarpet'

module ApplicationHelper
  include Pagy::Frontend

  def markdown(text)
    mark = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                   Constants::Redcarpet::OPTIONS)
    mark.render(text).html_safe
  end
end
