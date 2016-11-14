class Ingredient < ApplicationRecord
  belongs_to :eatable
  belongs_to :recipe

  validates_presence_of :measurement
  validates_presence_of :eatable

  def to_s
    "#{measurement} #{eatable.name}"
  end
end
