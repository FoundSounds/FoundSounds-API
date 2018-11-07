# frozen_string_literal: true

require "rails_helper"

# Need to add name, bio, url, twitter, portrait
#
def user_attributes
  {
    email: "test@example.com",
    username: "Test",
    bio: "bio",
    url: "https://example.com",
    twitter: "djensenius",
    portrait: "head.jpg"
  }
end

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  let(:user) { User.create(user_attributes) }

  describe "model validations" do
    it { expect(user).to allow_value(user_attributes[:email]).for(:email) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email).case_insensitive }

    it { expect(user).to allow_value(user_attributes[:username]).for(:username) }
    it { expect(user).to validate_presence_of(:username) }
    it { expect(user).to validate_uniqueness_of(:username).case_insensitive }

    user_attributes.except("email", "username").keys.each do |f|
      it { expect(user).to allow_value(user_attributes[f]).for(f) }
    end
  end

  describe "model associations" do
    it { expect(user).to have_many(:sounds) }
    it { expect(user).to have_many(:photos) }
    it { expect(user).to have_many(:likes) }
    it { expect(user).to have_many(:user_devices) }
    it { expect(user).to have_many(:sound_logs) }
  end
end
