# frozen_string_literal: true

module Types
  SoundType = GraphQL::ObjectType.define do
    name "SoundType"
    description "A sound"

    field :id, !types.ID
    field :latitude, types.Float
    field :longitude, types.Float
    field :user, !UserType
  end
end
