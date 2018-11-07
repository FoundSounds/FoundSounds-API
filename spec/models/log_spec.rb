# frozen_string_literal: true

require "rails_helper"

def log_attributes
  {
    device: "device",
    device_string: "device string",
    os: "fancyOS",
    uid: "123ABC",
    version: "1.0",
    build: "1",
    device_name: "iPhone!",
    device_system_name: "I am system name",
    device_version: "X",
    device_model: "sleek",
    device_localized_model: "sleeeeeeeeeeeeek",
    device_screen_bounds: "12x12"
  }
end

RSpec.describe Log, type: :model do
  it "has a valid factory" do
    expect(build(:log)).to be_valid
  end

  let(:log) { Log.create(log_attributes) }

  describe "model validations" do
    log_attributes.keys.each do |f|
      it { expect(log).to allow_value(log_attributes[f]).for(f) }
    end
  end
end
