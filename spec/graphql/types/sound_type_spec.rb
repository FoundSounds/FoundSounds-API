# frozen_string_literal: true

require "rails_helper"

describe Types::SoundType do
  types = GraphQL::Define::TypeDefiner.instance

  it "has an id type" do
    expect(subject).to have_field(:id).that_returns(!types.ID)
  end

  it "has an user type" do
    expect(subject).to have_field(:user).that_returns(!Types::UserType)
  end
end
