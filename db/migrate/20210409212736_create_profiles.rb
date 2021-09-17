class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text :bio
      t.string :github
      t.string :twitter
      t.string :linkedin
      t.string :website
      t.string :instagram
      t.string :facebook
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
