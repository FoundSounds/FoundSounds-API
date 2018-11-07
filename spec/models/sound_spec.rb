# frozen_string_literal: true

require "rails_helper"

def sound_attributes
  {
    description: "I am sound", longitude: 48.8435, latitude: 84.8975324,
    commons: true, public: true, finished: true,
    placement_location: "location", placement_name: "name",
    placement_address_dictionary: "dictionary", placement_iso_country_code: "CAD",
    placement_country: "CANADA", placement_postal_code: "N2G 3X8",
    placement_administrative_area: "Beep boop", placement_sub_administrative_area: "Sub beepboop",
    placement_locality: "Locality", placement_sub_locality: "Sublocality", placement_thoroughfare: "Thorough",
    placement_sub_thoroughfare: "Subthorough",
    placement_region: "Region", placement_inland_water: "Water", placement_ocean: "Yep",
    placement_areas_of_interest: "Mouse", abuse: false, device_name: "iPhone",
    device_system_name: "iOS", device_version: "10.4"
  }
end

def sound_fields
  [
    "description", "longitude", "latitude",
    "commons", "public", "finished",
    "placement_location", "placement_name",
    "placement_address_dictionary", "placement_iso_country_code",
    "placement_country", "placement_postal_code",
    "placement_administrative_area", "placement_sub_administrative_area",
    "placement_locality", "placement_sub_locality", "placement_thoroughfare",
    "placement_sub_thoroughfare",
    "placement_region", "placement_inland_water", "placement_ocean",
    "placement_areas_of_interest", "abuse", "device_name"
  ]
end

RSpec.describe Sound, type: :model do
  it "has a valid factory" do
    expect(build(:sound)).to be_valid
  end

  let(:user) { create(:user) }

  let(:attr) { sound_attributes.merge(user: user) }

  let(:sound) { Sound.create(attr) }

  describe "model validations" do
    it { expect(sound).to allow_value(attr[:user]).for(:user) }
    sound_fields.each do |f|
      it { expect(sound).to allow_value(attr[f]).for(f) }
    end
  end

  describe "model associations" do
    it { expect(sound).to belong_to(:user) }
    it { expect(sound).to have_many(:photos) }
    it { expect(sound).to have_many(:likes) }
    it { expect(sound).to have_many(:sound_logs) }
  end
end
