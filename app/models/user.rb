class User < ApplicationRecord
  rolify
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates_uniqueness_of :username


  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one  :profile, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :marks, dependent: :destroy
  has_many :bookmarked_articles, through: :bookmarks, source: :article, dependent: :destroy
  has_many :liked_articles, through: :likes, source: :article, dependent: :destroy
  has_many :marked_articles, through: :marks, source: :article, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  scope :users_with_articles, -> { with_role(:writer).includes(:profile).order(:username) }


  # bookmarks article
  def bookmark(article)
    bookmarked_articles << article
  end

  # checks whether an article is bookmarked
  def bookmarked?(article)
    bookmarked_article_ids.include?(article.id)
  end

  # removes bookmark from article
  def unbookmark(article)
    bookmarked_articles.destroy(article)
  end

  def like(article)
    liked_articles << article
  end

  def liked?(article)
    liked_article_ids.include?(article.id)
  end

  def unlike(article)
    liked_articles.destroy(article)
  end

  def mark(article)
    marked_articles << article
  end

  def marked?(article)
    marked_article_ids.include?(article.id)
  end

  def unmark(article)
    marked_articles.destroy(article)
  end


  # ensures that username is saved in a single name downcased.
  def username=(val)
    write_attribute(:username, val.downcase.split(" ").join)
  end

  # default to_s overwritten
  def to_s
    username.capitalize
  end

  # assigns default role
  def assign_default_role
    self.add_role(:reader) if self.roles.blank?
  end

  # displays roles assigned to a user
  def user_roles
    roles.collect(&:name).join(', ').split(', ').map(&:capitalize).join(', ')#.capitalize
  end

  # fetches all articles for a specific users
  def authored_articles
    Article.where(author: self)
  end

  # takes profile first and last name and make it full
  def full_name
    if self.profile.present?
      "#{self.profile.first_name.capitalize} #{self.profile.last_name.capitalize}"
    else
      "#{username.capitalize}"
    end
  end
end
