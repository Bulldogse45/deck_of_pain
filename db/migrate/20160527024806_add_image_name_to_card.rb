class AddImageNameToCard < ActiveRecord::Migration
  def change
    add_column :cards, :image_name, :string
  end
end
