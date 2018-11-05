# frozen_string_literal: true

require "rails_helper"

RSpec.describe QueryTypes::UserQueryType do
  types = GraphQL::Define::TypeDefiner.instance

  let!(:users) { create_list(:user, 1) }
  describe "querying all users" do
    it "has a :user that returns a [UserType]" do
      expect(subject).to have_field(:users).that_returns(types[Types::UserType])
    end

    it "returns all our created users" do
      query_result = subject.fields["users"].resolve(nil, nil, nil)
      users.each do |user|
        expect(query_result.to_a).to include(user)
      end
      expect(query_result.count).to eq(users.count)
    end
  end

  describe "query specific user" do
    it "returns the queried user" do
      id = users.first.id
      args = { id: id }
      ctx = { current_user: nil }
      query_result = subject.fields["user"].resolve(nil, args, ctx)
      expect(query_result).to eq(users.first)
    end
  end
end
