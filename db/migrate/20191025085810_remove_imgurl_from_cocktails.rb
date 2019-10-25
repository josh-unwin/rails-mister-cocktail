class RemoveImgurlFromCocktails < ActiveRecord::Migration[5.2]
  def change
    remove_column :cocktails, :imgurl, :string
  end
end
