class Level < ApplicationRecord
  has_many :articles, dependent: :destroy

  # beginner skill level
  def self.beginner
    where(name: "Beginner")
  end

  # intermediate skill level
  def self.intermediate
    where(name: "Intermediate")
  end
end
