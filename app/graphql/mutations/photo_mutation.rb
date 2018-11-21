# frozen_string_literal: true

module Mutations
  PhotoMutation = GraphQL::ObjectType.define do
    name "PhotoMutation"
    description "Mutations for photoss"

    field :create_photo, Types::PhotoType do
      argument :user_id, !types.ID
      argument :sound_id, !types.ID
      argument :file_name, !types.String

      resolve lambda { |_obj, args, ctx|
        return unless ctx[:current_user]

        ctx[:current_user].photos.create(file_name: args[:file_name], sound_id: args[:sound_id])
      }
    end

    field :edit_photo_file_name, Types::PhotoType do
      argument :id, !types.ID
      resolve ->(obj, args, ctx) { edit_photo_file_name(obj, args, ctx) }
    end

    field :delete_photo, Types::PhotoType do
      argument :id, !types.ID

      resolve lambda { |_obj, args, ctx|
        return unless ctx[:current_user]

        photo = Photo.find_by(id: args[:id], user_id: ctx[:current_user].id)
        return unless photo

        photo.destroy
      }
    end
  end
end

def edit_photo_file_name(_obj, args, ctx)
  return unless ctx[:current_user]

  photo = Photo.find_by(id: args[:id], user_id: ctx[:current_user].id)
  return unless photo

  photo.update(
    file_name: args[:file_name]
  )

  photo
end
