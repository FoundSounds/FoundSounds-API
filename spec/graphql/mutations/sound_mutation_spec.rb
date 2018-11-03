# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::SoundMutation do
  describe "creating a new sound" do
    let!(:user) { create(:user) }

    it "does not add a new sound if not logged in" do
      args = {
        user_id: user.id,
        description: "Wow this sound!"
      }
      ctx = { current_user: nil }
      subject.fields["create_sound"].resolve(nil, args, ctx)
      expect(Sound.count).to eq(0)
    end

    it "adds a new sound if logged in" do
      login_as(user, scope: :user)
      args = { description: "Wow this sound!" }
      ctx = { current_user: user }
      subject.fields["create_sound"].resolve(nil, args, ctx)
      expect(Sound.count).to eq(1)
      expect(Sound.last.description).to eq("Wow this sound!")
    end
  end
end

RSpec.describe Mutations::SoundMutation do
  describe "editing a sound" do
    let!(:user) { create(:user) }
    let!(:sound) { create(:sound, user: user) }

    it "does not update the sound description if not logged in" do
      args = sound_args
      ctx = { current_user: nil }
      query_result = subject.fields["edit_sound_description"].resolve(nil, args, ctx)
      expect(query_result).to eq nil
    end

    it "does not update the sound description for another user" do
      args = sound_args
      user.id = user.id + 1
      ctx = { current_user: user }
      query_result = subject.fields["edit_sound_description"].resolve(nil, args, ctx)
      expect(query_result).to eq nil
    end

    it "updates the sound description" do
      args = sound_args
      ctx = { current_user: user }
      query_result = subject.fields["edit_sound_description"].resolve(nil, args, ctx)
      expect(query_result.description).to eq "I am sound, ROAR"
    end
  end
end

RSpec.describe Mutations::SoundMutation do
  describe "deleting a sound" do
    let!(:user) { create(:user) }
    let!(:sound1) { create(:sound, user: user) }
    let!(:sound2) { create(:sound, user: user) }

    it "does not delete sound if not logged in" do
      args = { id: sound1.id }
      ctx = { current_user: nil }
      subject.fields["delete_sound"].resolve(nil, args, ctx)
      expect(Sound.count).to eq 2
    end

    it "does not delete sound if not user sound" do
      args = { id: sound1.id }
      user.id = user.id + 1
      ctx = { current_user: user }
      subject.fields["delete_sound"].resolve(nil, args, ctx)
      expect(Sound.count).to eq 2
    end

    it "deletes sound if correct user" do
      args = { id: sound1.id }
      ctx = { current_user: user }
      subject.fields["delete_sound"].resolve(nil, args, ctx)
      expect(Sound.count).to eq 1
      expect(Sound.all).not_to include(sound1)
    end
  end
end

def sound_args
  {
    id: sound.id,
    description: "I am sound, ROAR"
  }
end
