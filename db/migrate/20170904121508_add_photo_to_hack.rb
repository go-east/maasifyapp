class AddPhotoToHack < ActiveRecord::Migration[5.0]
  def change
    add_column :hacks, :photo, :string
  end
end
