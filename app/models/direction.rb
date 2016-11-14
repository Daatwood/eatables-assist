class Direction < ApplicationRecord
  belongs_to :recipe

  validates_presence_of :sequence
  validates_presence_of :instruction

  default_scope { order(:sequence) }

  before_validation(on: :create) do
    if recipe && sequence.nil?
      self.sequence = recipe.directions.count + 1
    end
  end

  def to_s
    "#{sequence}. #{instruction}"
  end
end
