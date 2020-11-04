require 'redcarpet'

module ApplicationHelper
  def markdown(text)
    options = {
      autolink: true,
      hard_wrap: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_spacing: true
    }

    mark = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    mark.render(text).html_safe
  end
end
