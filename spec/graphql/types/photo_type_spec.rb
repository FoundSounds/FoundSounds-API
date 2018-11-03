# frozen_string_literal: true

require "rails_helper"

describe Types::PhotoType do
  types = GraphQL::Define::TypeDefiner.instance

  it "has a has an :id that is of ID type" do
    expect(subject).to have_field(:id).that_returns(!types.ID)
  end

  it "has a photo types" do
    expect(subject).to have_field(:sound).that_returns(!Types::SoundType)
  end

  it "has user types" do
    expect(subject).to have_field(:user).that_returns(!Types::UserType)
  end
end
