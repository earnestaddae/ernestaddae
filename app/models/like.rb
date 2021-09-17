class Like < Favorite
  validates :user_id, uniqueness: { scope: :article_id } # ensures a unique article and user ids
end
