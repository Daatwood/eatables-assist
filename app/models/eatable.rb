class Eatable < ApplicationRecord
  validates_presence_of :name

  has_many :ingredients
  has_many :recipes, through: :ingredients
end
