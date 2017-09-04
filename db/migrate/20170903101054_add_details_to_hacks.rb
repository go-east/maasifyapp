class AddDetailsToHacks < ActiveRecord::Migration[5.0]
  def change
    add_column :hacks, :chapeau, :string
    add_column :hacks, :titre_deux, :string
    add_column :hacks, :description_deux, :string
    add_column :hacks, :titre_trois, :string
    add_column :hacks, :description_trois, :string
    add_column :hacks, :titre_quatre, :string
  end
end
