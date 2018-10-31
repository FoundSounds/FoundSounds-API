# frozen_string_literal: true

FactoryBot.define do
  factory :sound do
    description { "I AM SOUND" }
    latitude { 37.237 }
    longitude { -115.806999 }
    user { create(:user) }
  end
end
