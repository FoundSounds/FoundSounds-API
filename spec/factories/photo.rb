# frozen_string_literal: true

FactoryBot.define do
  factory :photo do
    file_name { "sound.jpg" }
    sound { create(:sound) }
    user { sound.user }
  end
end
