class InBodySerializer
  include JSONAPI::Serializer
  attributes :user_id, :nutritionist_id, :height, :weight, :age, :genre, :date, :body_water, :protein_mass, :minerals_mass, :body_fat, :lean_mass, :mass_free_of_fat, :muscle_mass, :imc, :percentage_body_fat, :right_arm, :left_arm, :right_leg, :left_leg, :aec
end
