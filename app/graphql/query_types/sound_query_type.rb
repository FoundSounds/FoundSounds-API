# frozen_string_literal: true

module QueryTypes
  SoundQueryType = GraphQL::ObjectType.define do
    name "SoundQueryType"
    description "The sound list query type"

    field :sound, Types::SoundType, "returns the queried sound" do
      argument :id, !types.ID

      resolve ->(_obj, args, _ctx) { Sound.find_by!(id: args[:id]) }
    end

    field :sounds, types[Types::SoundType], "returns all sounds" do
      resolve ->(_obj, _args, _ctx) { Sound.all }
    end
  end
end
