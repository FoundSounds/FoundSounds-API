# frozen_string_literal: true

module Types
  UserType = GraphQL::ObjectType.define do
    name "UserType"
    description "A user"

    field :id, !types.ID
    field :email, types.String
    field :created_at, types.String
  end
end
