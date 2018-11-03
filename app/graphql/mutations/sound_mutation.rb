# frozen_string_literal: true

module Mutations
  SoundMutation = GraphQL::ObjectType.define do
    name "SoundMutation"
    description "Mutations for sounds"

    field :create_sound, Types::SoundType do
      argument :user_id, !types.ID
      argument :description, !types.String

      resolve lambda { |_obj, args, ctx|
        return unless ctx[:current_user]

        ctx[:current_user].sounds.create(
          description: args[:description]
        )
      }
    end

    field :edit_sound_description, Types::SoundType do
      argument :id, !types.ID
      resolve ->(obj, args, ctx) { edit_sound_description(obj, args, ctx) }
    end

    field :delete_sound, Types::SoundType do
      argument :id, !types.ID

      resolve lambda { |_obj, args, ctx|
        return unless ctx[:current_user]

        sound = Sound.find_by(id: args[:id], user_id: ctx[:current_user].id)
        return unless sound

        sound.destroy
      }
    end
  end
end

def edit_sound_description(_obj, args, ctx)
  return unless ctx[:current_user]

  sound = Sound.find_by(id: args[:id], user_id: ctx[:current_user].id)
  return unless sound

  sound.update(
    description: args[:description]
  )

  sound
end
