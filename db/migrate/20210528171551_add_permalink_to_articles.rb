class AddPermalinkToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :permalink, :string
  end
end
