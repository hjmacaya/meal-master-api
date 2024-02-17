class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :name, :last_name, :rut, :phone
end
