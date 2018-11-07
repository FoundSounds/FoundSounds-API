# frozen_string_literal: true

FactoryBot.define do
  factory :log do
    device { "device" }
    device_string { "device type" }
    os { "coolOS" }
    uid { "uid" }
    version { "1.0" }
    build { "1" }
    device_name { "device name" }
    device_system_name { "Device SYSTEM name" }
    device_version { "X" }
    device_model { "XS" }
    device_localized_model { "CA_X" }
    device_screen_bounds { "1x1" }
  end
end
