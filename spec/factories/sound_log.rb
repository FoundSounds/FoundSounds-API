# frozen_string_literal: true

FactoryBot.define do
  factory :sound_log do
    sound { create(:sound) }
    user { sound.user }
    device_type { "device type" }
    os { "coolOS" }
    version { "1.0" }
    build { "1" }
    device_name { "device name" }
    device_system_name { "Device SYSTEM name" }
    device_version { "X" }
    device_model { "XS" }
    device_localized_model { "CA_X" }
  end
end
