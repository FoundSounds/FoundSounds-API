# frozen_string_literal: true

require "rails_helper"

RSpec.describe UserDevice, type: :model do
  it "has a valid factory" do
    expect(build(:user_device)).to be_valid
  end

  let(:sound) { create(:sound) }
  let(:user) { sound.user }

  let(:attributes) do
    {
      user: user,
      device_key: "string",
      device: "string"
    }
  end

  let(:user_device) { UserDevice.create(attributes) }

  describe "model validations" do
    it { expect(user_device).to allow_value(attributes[:user]).for(:user) }
    it { expect(user_device).to allow_value(attributes[:device_key]).for(:device_key) }
    it { expect(user_device).to allow_value(attributes[:device]).for(:device) }
  end

  describe "model associations" do
    it { expect(user_device).to belong_to(:user) }
  end
end
