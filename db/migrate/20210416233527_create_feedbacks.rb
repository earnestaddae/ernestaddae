class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.text :message
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
