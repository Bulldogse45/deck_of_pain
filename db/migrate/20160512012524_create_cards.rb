class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :face
      t.string :suit
      t.integer :value

      t.timestamps null: false
    end
  end
end
