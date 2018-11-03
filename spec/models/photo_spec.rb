# frozen_string_literal: true

require "rails_helper"

RSpec.describe Photo, type: :model do
  it "has a valid factory" do
    expect(build(:photo)).to be_valid
  end

  let(:sound) { create(:sound) }
  let(:user) { sonud.user }

  let(:attributes) do
    {
      filename: "beep.jpg"
    }
  end

  let(:photo) { Photo.create(attributes) }

  describe "model validations" do
    it { expect(photo).to allow_value(attributes[:filename]).for(:filename) }
  end

  describe "model associations" do
    it { expect(photo).to belong_to(:user) }
    it { expect(photo).to belong_to(:sound) }
  end
end
