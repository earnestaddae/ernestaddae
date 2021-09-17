class RemoveFieldsFromProfiles < ActiveRecord::Migration[6.1]
  def change
    remove_column :profiles, :github, :string
    remove_column :profiles, :twitter, :string
    remove_column :profiles, :linkedin, :string
    remove_column :profiles, :website, :string
    remove_column :profiles, :instagram, :string
    remove_column :profiles, :facebook, :string
  end
end
