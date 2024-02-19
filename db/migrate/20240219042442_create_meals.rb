class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.float :cereals_portions
      t.float :protein_portions
      t.float :vegetables_portions
      t.float :fruit_portions
      t.float :fat_portions
      t.float :dairy_portions

      t.timestamps
    end
  end
end
