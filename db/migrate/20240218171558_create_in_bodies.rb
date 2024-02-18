class CreateInBodies < ActiveRecord::Migration[7.1]
  def change
    create_table :in_bodies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :nutritionist, null: false, foreign_key: true
      t.float :height
      t.float :weight
      t.integer :age
      t.string :genre
      t.date :date
      t.float :body_water
      t.float :protein_mass
      t.float :minerals_mass
      t.float :body_fat
      t.float :lean_mass
      t.float :mass_free_of_fat
      t.float :muscle_mass
      t.float :imc
      t.float :percentage_body_fat
      t.float :right_arm
      t.float :left_arm
      t.string :trunk_float
      t.float :right_leg
      t.float :left_leg
      t.float :aec

      t.timestamps
    end
  end
end
