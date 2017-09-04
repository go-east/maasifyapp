class AddDescriptionQuatreToHacks < ActiveRecord::Migration[5.0]
  def change
    add_column :hacks, :description_quatre, :string
  end
end
