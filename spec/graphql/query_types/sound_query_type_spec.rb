# frozen_string_literal: true

require "rails_helper"

RSpec.describe QueryTypes::SoundQueryType do
  types = GraphQL::Define::TypeDefiner.instance

  let!(:sounds) { create_list(:sound, 1) }
  describe "querying all sounds" do
    it "has a :sound that returns a SoundList type" do
      expect(subject).to have_field(:sounds).that_returns(types[Types::SoundType])
    end

    it "returns all our created todo lists" do
      query_result = subject.fields["sounds"].resolve(nil, nil, nil)
      sounds.each do |sound|
        expect(query_result.to_a).to include(sound)
      end
      expect(query_result.count).to eq(sounds.count)
    end
  end

  describe "query specific sound" do
    it "returns the queried sound" do
      id = sounds.first.id
      args = { id: id }
      query_result = subject.fields["sound"].resolve(nil, args, nil)
      expect(query_result).to eq(sounds.first)
    end
  end
end
