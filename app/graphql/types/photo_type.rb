# frozen_string_literal: true

module Types
  PhotoType = GraphQL::ObjectType.define do
    name "PhotoType"
    description "Photo associated with sound"

    field :id, !types.ID
    field :file_name, !types.String
    field :user, !UserType
    field :sound, !SoundType
  end
end
