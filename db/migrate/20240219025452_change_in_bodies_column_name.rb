class ChangeInBodiesColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :in_bodies, :trunk_float, :trunk
  end
end
