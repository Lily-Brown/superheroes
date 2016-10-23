class Superhero < ApplicationRecord
  belongs_to :team
  has_many :superhero_superpowers, dependent: :destroy
  has_many :superpowers, through: :superhero_superpowers
end
