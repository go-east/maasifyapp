class AddTagToHacks < ActiveRecord::Migration[5.0]
  def change
    add_column :hacks, :tag_un, :string
    add_column :hacks, :tag_deux, :string
    add_column :hacks, :tag_trois, :string
  end
end
