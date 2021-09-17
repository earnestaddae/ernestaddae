class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :email

      t.timestamps
    end

    add_index :subscriptions, [:email, :user_id], unique: true,
              comment: "No user can have two subscriptions with the same email"
  end
end
