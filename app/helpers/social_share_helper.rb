module SocialShareHelper
  def twitter(article)
    url = "https://twitter.com/intent/tweet?text=#{article.capitalize_title} #{article_url(article)}"
    link_to url, class: "mr-1 badge badge-info text-light mb-1 p-1", target: "_blank" do
      "<i class='mr-1 fa fa-twitter text-light'></i>Tweet</a>".html_safe
    end
  end

  def facebook(article)
    url = "https://www.facebook.com/sharer/sharer.php?u=#{article_url(article)}"
    link_to url, class: "mr-1 badge badge-primary text-light mb-1 p-1", target: "_blank" do
      "<i class='mr-1 fa fa-facebook text-light'></i>Share</a>".html_safe
    end
  end

  def linkedin(article)
    url = "http://www.linkedin.com/shareArticle?mini=true&url=#{article_url}&title=#{article.capitalize_title}&summary=#{article.summary}&source=Recognize"
    link_to url, class: "mr-1 badge badge-info text-light mb-1 p-1", target: "_blank" do
      "<i class='mr-1 fa fa-linkedin text-light'></i>Linkedin</a>".html_safe
    end
  end

  def email(article)
    mail_to "", class: "mr-1 badge badge-danger text-light mb-1 p-1",
                subject: "Ruby Tutorial for you",
                body: %Q(Check out this Ruby article #{article.capitalize_title} at #{article_url(article)}) do
      "<i class='mr-1 fa fa-envelope text-light'></i>Email</a>".html_safe
    end
  end
end
