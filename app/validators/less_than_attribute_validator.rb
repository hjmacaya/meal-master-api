class LessThanAttributeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    # Extract the attribute to compare to
    attribute_to_compare = options[:compare_to]
    value_to_compare = record.send(attribute_to_compare)

    # Check if values are present & add error
    if value.present? && value_to_compare.present?
      unless value < value_to_compare
        record.errors.add(attribute, "must be less than #{attribute_to_compare}")
      end
    end
  end
end
