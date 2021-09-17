require "kramdown"

module ApplicationHelper
   # generates dynamic page title
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Ruby | JavaScript | Go").join(" - ")
      end
    end
  end

  # applies active
  def active?(path)
    "active" if current_page? path
  end

  # admins only block
  def admins_only(&block)
    block.call if current_user.try(:admin?)
  end

  def kram(text)
    kram = Kramdown::Document.new(text).to_html.html_safe
  end

  def forward_arrow
    "\u00BB"
  end
end
