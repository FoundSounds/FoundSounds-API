# frozen_string_literal: true

module Types
  SoundType = GraphQL::ObjectType.define do
    name "SoundType"
    description "A sound"

    field :id, !types.ID
    field :latitude, types.Float
    field :longitude, types.Float
    field :user, !UserType
    field :photos, types[Types::PhotoType] do
      resolve ->(obj, _args, _ctx) { obj.photos }
    end
  end
end
