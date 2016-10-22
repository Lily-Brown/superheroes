class CreateSuperheros < ActiveRecord::Migration[5.0]
  def change
    create_table :superheros do |t|
      t.string :name
      t.string :true_identity
      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
