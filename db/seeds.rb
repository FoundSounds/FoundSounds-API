# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"

SOUNDS = 10.times.map do
  {
    "latitude": Faker::Address.latitude,
    "longitude": Faker::Address.longitude,
    "description": Faker::TwinPeaks.quote
  }
end

SOUND_USERS = {
  "david@example.com": SOUNDS[0,4],
  "banana@example.com": SOUNDS[5,9]
}

SOUND_USERS.each do |email, sounds|
  user = User.new(email: email, password: Faker::Internet.password, username: Faker::Internet.username)
  sounds.each { |sound| user.sounds.build(sound) }
  user.save
end
