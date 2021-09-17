# require 'rouge'
require 'rouge/plugins/redcarpet'


module ArticlesHelper
  # define the renderer class
  class MarkdownHTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet # includes rouge for ruby highligting
  end

  # for rendering article in markdown
  def markdown(text)
    # set markdown extensions
    extensions = {
      tables: true,
      highlight: true,
      fenced_code_blocks: true,
      no_intra_emphasis: true,
      autolink: true,
      lax_spacing: true,
      lax_html_blocks: true,
      quote: true
    }

    # set options
    options = {
      hard_wrap: true,
      prettify: true,
      with_toc_data: true
    }


    renderer = MarkdownHTML.new(options) # instantiate renderer class
    markdown_text = Redcarpet::Markdown.new(renderer, extensions) # calls redcarpet with the renderer
    markdown_text.render(text).html_safe # takes the text and render in markdown
  end

  # generate table of content from headings
  def markdown_header(text)
    markdown_header = Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC)
    markdown_header.render(text).html_safe
  end

  # shows appropriate article state
  def article_mode(article)
    content_tag(:span, article.published? ? "Published" : "Draft", class: "badge badge-#{article.published? ? "success" : "primary"}")
  end

  # checks whether or not an article is liked
  def like_button(article)
    if user_signed_in? && current_user.liked?(article)
     link_to unlike_article_path(article), method: :delete, class: "btn btn-danger border-right" do
      "<i class='fa fa-fw fa-heart pt-2'></i>".html_safe
     end
    else
      link_to like_article_path(article), method: :post, class: "btn btn-secondary border-right" do
        "<i class='fa fa-fw fa-heart-o pt-2'></i>".html_safe
      end
    end
  end

  # checks whether or not an article is marked
  def mark_button(article)
    if user_signed_in? && current_user.marked?(article)
     link_to unmark_article_path(article), method: :delete, class: "btn btn-success border-right border-left" do
      "<i class='fa fa-fw fa-check pt-2'></i> Completed".html_safe
     end
    else
      link_to mark_article_path(article), method: :post, class: "btn btn-secondary border-right border-left" do
        "<i class='fa fa-fw fa-check pt-2'></i> Mark as Completed".html_safe
      end
    end
  end

  # checks whether or not an article is bookmarked
  def bookmark_button(article)
    if user_signed_in? && current_user.bookmarked?(article)
     link_to unbookmark_article_path(article), method: :delete, class: "btn btn-info border-left" do
      "<i class='fa fa-fw fa-bookmark pt-2'></i>".html_safe
     end
    else
      link_to bookmark_article_path(article), method: :post, class: "btn btn-secondary border-left" do
        "<i class='fa fa-fw fa-bookmark-o pt-2'></i>".html_safe
      end
    end
  end

  # displays when article is liked on the bookmark index
  def like_checker(article)
    if user_signed_in? && current_user.liked?(article)
      "<span title='liked' class='float-right'><i class='fa fa-fw fa-heart text-danger'></i></span>".html_safe
    end
  end

  # displays when article is marked on the bookmark index
  def mark_checker(article)
    if user_signed_in? && current_user.marked?(article)
      "<span title='Marked' class='float-right'><i class='fa fa-fw fa-check text-success'></i></span>".html_safe
    end
  end

  # displays when article is bookmarked on the bookmark index
  def bookmark_checker(article)
    if user_signed_in? && current_user.bookmarked?(article)
      "<span title='Bookmarked' class='float-right'><i class='fa fa-fw fa-bookmark text-info'></i></span>".html_safe
    end
  end

end
