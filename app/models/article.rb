class Article < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_article,
                  against: [
                    :title
                    # ,
                    # :summary,
                    # :body
                  ],
                  using: {
                    tsearch: { prefix: true }
                  } # ensures part of word search

  resourcify
  before_create :set_permalink
  before_update :set_permalink

  def self.find_by_permalink(permalink)
    find_by(permalink: permalink)
  end

  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :level
  has_and_belongs_to_many :tags, uniq: true #, :join_table => "articles_tags", :foreign_key => "tags_id"
  belongs_to :author, class_name: "User"
  has_many :favorites
  has_many :bookmarks, -> { where(type: 'Bookmark') }, dependent: :destroy
  has_many :likes, -> { where(type: 'Like') }, dependent: :destroy
  has_many :marks, -> { where(type: 'Mark') }, dependent: :destroy
  has_one_attached :attachment
  has_many_attached :attachments

  validates :attachment, attached: true, allow_blank: true,
                    content_type: ['image/png', 'image/jpg', 'image/jpeg', 'image/gif'],
                    dimension: {
                                width: { min: 1920 },
                                height: { min: 1080 },
                                message: 'image must have min_width: 1920 & min_height: 1080 😌'
                              }

  # def large_image
  #   attachment.variant(resize_to_fit: [730, nil])
  # end

  # def medium_image
  #   attachment.variant(resize_to_limit: [350, 233])
  # end

  # def thumb_image
  #   attachment.variant(resize_to_limit: [243, 137])
  # end


  validates :title, :summary, :category_id, :level_id, :body, presence: true


  # scope :featured, -> { order(created_at: :desc).published.first }
  scope :published, -> { published.order(created_at: :desc) }
  default_scope -> { order(created_at: :desc) }

  enum mode: {
    draft: 0,
    published: 1
  }


  # capitlizes the article title
  def capitalize_title
    title.gsub(/\w+/, &:capitalize)
  end

  # ruby beginner tutorials
  def self.beginner
    joins(:level).merge(Level.beginner).joins(:category).merge(Category.ruby)
  end

  # ruby intermediate tutorials
  def self.intermediate
    joins(:level).merge(Level.intermediate).joins(:category).merge(Category.ruby)
  end

  # ruby on rails articles
  def self.rails
    joins(:category).merge(Category.rails)
  end

  def to_param
    permalink
  end

  def set_permalink
    self.permalink = title.parameterize
  end



end
