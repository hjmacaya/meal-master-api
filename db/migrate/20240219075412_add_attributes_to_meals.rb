class AddAttributesToMeals < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :meal_type, :string
    add_reference :meals, :guideline, null: true, foreign_key: true
  end
end
