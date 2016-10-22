class AddImageurlToSuperheroes < ActiveRecord::Migration[5.0]
  def change
    add_column :superheros, :image_url, :string
  end
end
