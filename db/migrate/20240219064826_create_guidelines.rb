class CreateGuidelines < ActiveRecord::Migration[7.1]
  def change
    create_table :guidelines do |t|
      t.references :nutritionist, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.float :calories_requirement_per_day

      t.timestamps
    end
  end
end
