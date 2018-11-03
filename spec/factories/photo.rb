# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    filename { "sound.jpg" }
    sound { create(:sound) }
    user { sound.user }
  end
end
