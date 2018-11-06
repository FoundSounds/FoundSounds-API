# frozen_string_literal: true

require "rails_helper"

RSpec.describe Abuse, type: :model do
  it "has a valid factory" do
    expect(build(:abuse)).to be_valid
  end

  let(:sound) { create(:sound) }
  let(:user) { sound.user }

  let(:attributes) do
    {
      sound: sound,
      user: user
    }
  end

  let(:abuse) { Abuse.create(attributes) }

  describe "model validations" do
    it { expect(abuse).to allow_value(attributes[:user]).for(:user) }
    it { expect(abuse).to allow_value(attributes[:sound]).for(:sound) }
  end

  describe "model associations" do
    it { expect(abuse).to belong_to(:user) }
    it { expect(abuse).to belong_to(:sound) }
  end
end
