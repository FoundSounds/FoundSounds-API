# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::SoundMutation do
  describe "creating a new sound" do
    let!(:user) { create(:user) }

    it "adds a new sound" do
      args = {
        user_id: user.id,
        description: "Wow this sound!"
      }

      subject.fields["create_sound"].resolve(nil, args, nil)
      expect(Sound.count).to eq(1)
      expect(Sound.last.description).to eq("Wow this sound!")
    end

    pending "cannot add sounds if not logged in"
    pending "cannot add sound for different user"
  end
end

RSpec.describe Mutations::SoundMutation do
  describe "editing a sound" do
    let!(:user) { create(:user) }
    let!(:sound) { create(:sound, user: user) }

    it "updates the sound description" do
      args = {
        id: sound.id,
        description: "I am sound, ROAR"
      }
      query_result = subject.fields["edit_sound_description"].resolve(nil, args, nil)

      expect(query_result.description).to eq "I am sound, ROAR"
    end

    pending "cannot edit sounds if not logged in"
    pending "cannot edit sound for different user"
  end
end

RSpec.describe Mutations::SoundMutation do
  describe "deleting a sound" do
    let!(:user) { create(:user) }
    let!(:sound1) { create(:sound, user: user) }
    let!(:sound2) { create(:sound, user: user) }
    let!(:sound3) { create(:sound, user: user) }

    it "delete a sound" do
      args = {
        id: sound1.id
      }
      subject.fields["delete_sound"].resolve(nil, args, nil)

      expect(Sound.count).to eq 2
      expect(Sound.all).not_to include(sound1)
    end

    pending "cannot delete sounds if not logged in"
    pending "cannot delete sound for different user"
  end
end
