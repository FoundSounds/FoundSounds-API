# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    sound { create(:sound) }
    user { sound.user }
  end
end
