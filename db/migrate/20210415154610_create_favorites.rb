class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :article, null: false, foreign_key: true
      t.string :type

      t.timestamps
    end


    add_index :favorites, [ :user_id, :article_id ] #, unique: true
  end
end
