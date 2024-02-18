class AddJtiToNutritionists < ActiveRecord::Migration[7.1]
  def change
    add_column :nutritionists, :jti, :string, null: false
    add_index :nutritionists, :jti, unique: true
  end
end
