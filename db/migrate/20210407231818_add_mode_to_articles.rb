class AddModeToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :mode, :integer, default: 0
  end
end
