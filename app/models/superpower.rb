class Superpower < ApplicationRecord
  has_many :superhero_superpowers, dependent: :destroy
  has_many :superheroes, through: :superhero_superpowers
  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.name ||= ''
    self.description ||=''
  end

  def self.search(search)
    if search
      all.where("name LIKE ?", "%#{search}%").order(:name)
    else
      all.order(:name)
    end
  end  
end
