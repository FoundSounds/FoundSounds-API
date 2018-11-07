# frozen_string_literal: true

FactoryBot.define do
  factory :user_device do
    user { create(:user) }
    device_key { "I AM THE DEVICE KEY" }
    device { "I AM THE DEVICE" }
  end
end
