# frozen_string_literal: true

require "rails_helper"

describe Types::UserType do
  types = GraphQL::Define::TypeDefiner.instance

  it "has a has an :id that is of ID type" do
    expect(subject).to have_field(:id).that_returns(!types.ID)
  end

  it "has a :created_at field of String type" do
    expect(subject).to have_field(:created_at).that_returns(types.String)
  end

  it "has a :name field of String type" do
    expect(subject).to have_field(:name).that_returns(types.String)
  end

  it "has a has an :bio that is of String type" do
    expect(subject).to have_field(:bio).that_returns(types.String)
  end

  it "has a has an :url that is of String type" do
    expect(subject).to have_field(:url).that_returns(types.String)
  end

  it "has a has an :twitter that is of String type" do
    expect(subject).to have_field(:twitter).that_returns(types.String)
  end

  it "has a has an :portrait that is of String type" do
    expect(subject).to have_field(:portrait).that_returns(types.String)
  end
end

describe Types::UserType do
  types = GraphQL::Define::TypeDefiner.instance

  it "has sound types" do
    expect(subject).to have_field(:sounds).that_returns(types[Types::SoundType])
  end

  it "has photo types" do
    expect(subject).to have_field(:photos).that_returns(types[Types::PhotoType])
  end
end
