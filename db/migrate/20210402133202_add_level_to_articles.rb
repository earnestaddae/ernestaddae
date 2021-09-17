class AddLevelToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :level, foreign_key: true
  end
end
