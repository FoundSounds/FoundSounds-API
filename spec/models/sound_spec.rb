# frozen_string_literal: true

require "rails_helper"

RSpec.describe Sound, type: :model do
  it "has a valid factory" do
    expect(build(:sound)).to be_valid
  end

  let(:user) { create(:user) }

  let(:attributes) do
    {
      description: "A test item",
      latitude: 34.5184,
      longitude: -108.1058
    }
  end

  let(:sound) { Sound.create(attributes) }

  describe "model validations" do
    it { expect(sound).to allow_value(attributes[:description]).for(:description) }
    it { expect(sound).to allow_value(attributes[:latitude]).for(:latitude) }
    it { expect(sound).to allow_value(attributes[:longitude]).for(:longitude) }
  end

  describe "model associations" do
    it { expect(sound).to belong_to(:user) }
    it { expect(sound).to have_many(:photos) }
    it { expect(sound).to have_many(:likes) }
    it { expect(sound).to have_many(:sound_logs) }
  end
end
