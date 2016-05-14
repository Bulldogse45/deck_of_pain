class CreateSuits < ActiveRecord::Migration
  def change
    create_table :suits do |t|
      t.string :name
      t.integer :exercise_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
