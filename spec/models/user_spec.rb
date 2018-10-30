# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  let(:attributes) do
    {
      email: "test@example.com",
      username: "Test",
      encrypted_password: "testing"
    }
  end

  let(:user) { User.create(attributes) }

  describe "model validations" do
    it { expect(user).to allow_value(attributes[:email]).for(:email) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email).case_insensitive }

    it { expect(user).to allow_value(attributes[:username]).for(:username) }
    pending "username cannot be blank"
    pending "username must be unique"
    it { expect(user).to validate_uniqueness_of(:username).case_insensitive }

    it { expect(user).to allow_value(attributes[:encrypted_password]).for(:password) }
    pending "password cannot be blank"
  end

  describe "model associations" do
    it { expect(user).to have_many(:sounds) }
  end
end
