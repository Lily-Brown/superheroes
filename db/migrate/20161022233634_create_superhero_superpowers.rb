class CreateSuperheroSuperpowers < ActiveRecord::Migration[5.0]
  def change
    create_table :superhero_superpowers do |t|
      t.belongs_to :superhero, foreign_key: true
      t.belongs_to :superpower, foreign_key: true

      t.timestamps
    end
  end
end
