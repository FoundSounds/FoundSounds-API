# frozen_string_literal: true

module Types
  SoundType = GraphQL::ObjectType.define do
    name "SoundType"
    description "A sound"

    field :id, !types.ID
    field :latitude, types.Float
    field :longitude, types.Float
    field :user, !UserType
    field :abuse, !types.Boolean
    field :plays, !types.Int
    field :public, !types.Boolean
    field :commons, !types.Boolean

    string_fields.each do |str|
      field str, types.String
    end

    field :photos, types[Types::PhotoType] do
      resolve ->(obj, _args, _ctx) { obj.photos }
    end
  end
end

def string_fields
  [
    "description", "placement_location",
    "placement_name", "placement_address_dictionary",
    "placement_iso_country_code", "placement_country",
    "placement_postal_code", "placement_administrative_area",
    "placement_locality", "placement_thoroughfare",
    "placement_sub_thoroughfare", "placement_region",
    "placement_inland_water", "placement_ocean",
    "placement_areas_of_interest",
    "device_name", "device_system_name",
    "device_version",
    "device_model",
    "device_localized_model",
    "device_screen_bounds"
  ]
end
