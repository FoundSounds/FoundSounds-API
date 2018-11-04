# frozen_string_literal: true

require "rails_helper"

describe Types::SoundType do
  types = GraphQL::Define::TypeDefiner.instance

  it "has an id type" do
    expect(subject).to have_field(:id).that_returns(!types.ID)
  end

  it "has an user type" do
    expect(subject).to have_field(:user).that_returns(!Types::UserType)
  end

  it "has a photo types" do
    expect(subject).to have_field(:photos).that_returns(types[Types::PhotoType])
  end

  it "has latitude field" do
    expect(subject).to have_field(:latitude).that_returns(types.Float)
  end

  it "has longitude field" do
    expect(subject).to have_field(:longitude).that_returns(types.Float)
  end

  it "has plays field" do
    expect(subject).to have_field(:plays).that_returns(!types.Int)
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

def bool_fields
  [
    "public",
    "commons",
    "abuse"
  ]
end

describe Types::SoundType do
  types = GraphQL::Define::TypeDefiner.instance

  bool_fields.each do |bool|
    it "has field #{bool} of type Boolean" do
      expect(subject).to have_field(bool).that_returns(!types.Boolean)
    end
  end

  string_fields.each do |str|
    it "has field #{str} of type String" do
      expect(subject).to have_field(str).that_returns(types.String)
    end
  end
end
