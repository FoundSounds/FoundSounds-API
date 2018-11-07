# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    username { "test" }
    password { "secret" }
    name { "Test User" }
    bio { "I like sounds!" }
    url { "http://sounddszzz" }
    twitter { "@Found_Sounds" }
    portrait { "sound.jpg" }
  end
end
