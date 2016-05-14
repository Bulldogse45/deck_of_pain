class AddDeckIdToSuits < ActiveRecord::Migration
  def change
    add_column :suits, :deck_id, :integer
  end
end
