class Team < ApplicationRecord
  has_many :superheroes
  validates :name, :publisher, presence: true

  accepts_nested_attributes_for :superheroes
end
