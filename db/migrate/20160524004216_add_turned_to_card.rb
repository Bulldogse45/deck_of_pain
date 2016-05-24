class AddTurnedToCard < ActiveRecord::Migration
  def change
    add_column :cards, :turned, :boolean
  end
end
