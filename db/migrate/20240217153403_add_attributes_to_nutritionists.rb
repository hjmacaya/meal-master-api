class AddAttributesToNutritionists < ActiveRecord::Migration[7.1]
  def change
    add_column :nutritionists, :name, :string
    add_column :nutritionists, :last_name, :string
    add_column :nutritionists, :rut, :string
    add_column :nutritionists, :phone, :string
    add_column :nutritionists, :academic_title, :string
    add_column :nutritionists, :company, :string
  end
end
