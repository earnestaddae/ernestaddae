class CreateNewsletters < ActiveRecord::Migration[6.1]
  def change
    create_table :newsletters do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
