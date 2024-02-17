class NutritionistSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :last_name, :rut, :phone, :academic_title, :company
end
