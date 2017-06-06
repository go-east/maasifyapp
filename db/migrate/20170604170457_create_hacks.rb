class CreateHacks < ActiveRecord::Migration[5.0]
  def change
    create_table :hacks do |t|
      t.string :titre
      t.string :description
      t.string :categorie_une
      t.integer :qualite
      t.string :image

      t.timestamps
    end
  end
end
