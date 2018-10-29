# frozen_string_literal: true

class FoundSoundsApiSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
end
