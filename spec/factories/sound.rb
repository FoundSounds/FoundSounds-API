# frozen_string_literal: true

FactoryBot.define do
  factory :sound do
    description { "I AM SOUND" }
    latitude { 37.237 }
    longitude { -115.806999 }
    user { create(:user) }
    commons  { true }

    public { true }

    finished { true }
    placement_location { "location" }
    placement_name { "name" }
    placement_address_dictionary { "dictionary" }
    placement_iso_country_code { "CAD" }
    placement_country { "CANADA" }
    placement_postal_code { "N2G 3X8" }
    placement_administrative_area { "Beep boop" }
    placement_sub_administrative_area { "Sub beepboop" }
    placement_locality { "Locality" }
    placement_sub_locality { "Sublocality" }
    placement_thoroughfare { "Thorough" }
    placement_sub_thoroughfare { "Subthorough" }
    placement_region { "Region" }
    placement_inland_water { "Water" }
    placement_ocean { "Yep" }
  end
end
