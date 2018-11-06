# frozen_string_literal: true

FactoryBot.define do
  factory :abuse do
    sound { create(:sound) }
    user { sound.user }
  end
end
