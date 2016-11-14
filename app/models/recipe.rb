class Recipe < ApplicationRecord
  belongs_to :user

  has_many :ingredients
  has_many :directions

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :user

  before_create do
    self.name.capitalize!
  end

  def directions_create_from_input(input)
    precount = 1 + directions.count
    input.split("\n").each_with_index do |instruction, index|
      directions.create(sequence: precount+index,
                        instruction: instruction)
    end
  end

  def to_s
    output = "#{name}\n#{description}\n"
    (ingredients+directions).each do |item|
      output << item.to_s + "\n"
    end
    output
  end
end
