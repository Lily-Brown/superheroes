class Team < ApplicationRecord
  has_many :superheroes

  accepts_nested_attributes_for :superheroes
end
