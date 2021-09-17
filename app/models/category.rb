class Category < ApplicationRecord
  has_many :articles, dependent: :destroy


  validates :name, :description, presence: true
  validates_uniqueness_of :name

  def self.ruby
    where(name: "Ruby")
  end

  def self.rails
    where(name: "Rails")
  end
end
