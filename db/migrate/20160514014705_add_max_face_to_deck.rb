class AddMaxFaceToDeck < ActiveRecord::Migration
  def change
    add_column :decks, :max_face, :string
  end
end
