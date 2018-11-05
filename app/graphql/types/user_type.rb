# frozen_string_literal: true

module Types
  UserType = GraphQL::ObjectType.define do
    name "UserType"
    description "A user"

    field :id, !types.ID
    field :created_at, types.String
    field :name, types.String
    field :bio, types.String
    field :url, types.String
    field :twitter, types.String
    field :portrait, types.String

    field :email, types.String do
      resolve lambda { |obj, _args, ctx|
        return obj.email if ctx[:current_user] && ctx[:current_user].id == obj.id

        return nil
      }
    end
    field :sounds, types[Types::SoundType] do
      resolve ->(obj, _args, _ctx) { obj.sounds }
    end
    field :photos, types[Types::PhotoType] do
      resolve ->(obj, _args, _ctx) { obj.photos }
    end
  end
end
