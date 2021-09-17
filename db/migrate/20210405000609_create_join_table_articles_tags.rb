class CreateJoinTableArticlesTags < ActiveRecord::Migration[6.1]
  def change
    create_join_table :articles, :tags do |t|
      t.index [:article_id, :tag_id]
      t.index [:tag_id, :article_id], unique: true
    end
  end
end
