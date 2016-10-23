class Superpower < ApplicationRecord
  has_many :superhero_superpowers, dependent: :destroy
  has_many :superheroes, through: :superhero_superpowers
end
