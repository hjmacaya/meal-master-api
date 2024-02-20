class ChangeTrunkType < ActiveRecord::Migration[7.1]
  def change
    change_column :in_bodies, :trunk, 'float USING trunk::double precision'
  end
end
