# frozen_string_literal: true

require "rails_helper"

def sound_log_attributes
  {
    sound: sound,
    user: user,
    device_type: "type",
    os: "fancyOS",
    version: "1.0",
    build: "1",
    device_name: "iPhone!",
    device_system_name: "I am system name",
    device_version: "X",
    device_model: "sleek",
    device_localized_model: "sleeeeeeeeeeeeek"
  }
end

def sound_log_fields
  [
    "device_type",
    "os",
    "version",
    "build",
    "device_name",
    "device_system_name",
    "device_version",
    "device_model",
    "device_localized_model"
  ]
end

RSpec.describe SoundLog, type: :model do
  it "has a valid factory" do
    expect(build(:sound_log)).to be_valid
  end

  let(:sound) { create(:sound) }
  let(:user) { sound.user }

  let(:sound_log) { SoundLog.create(sound_log_attributes) }

  describe "model validations" do
    it { expect(sound_log).to allow_value(sound_log_attributes[:user]).for(:user) }
    it { expect(sound_log).to allow_value(sound_log_attributes[:sound]).for(:sound) }
    sound_log_fields.each do |f|
      it { expect(sound_log).to allow_value(sound_log_attributes[f]).for(f) }
    end
  end

  describe "model associations" do
    it { expect(sound_log).to belong_to(:user) }
    it { expect(sound_log).to belong_to(:sound) }
  end
end
