# frozen_string_literal: true

require "rails_helper"

RSpec.describe Mutations::PhotoMutation do
  describe "should not create a new photo" do
    let!(:user) { create(:user) }
    let!(:sound) { create(:sound, user: user) }

    it "does not add a new photo if not logged in" do
      args = { user_id: user.id, sound_id: sound.id, file_name: "whee.jpg" }
      ctx = { current_user: nil }
      subject.fields["create_photo"].resolve(nil, args, ctx)
      expect(Photo.count).to eq(0)
    end

    it "does not add a new photo if no sound" do
      args = { user_id: user.id, file_name: "whee.jpg" }
      ctx = { current_user: user }
      subject.fields["create_photo"].resolve(nil, args, ctx)
      expect(Photo.count).to eq(0)
    end

    it "does not add a new photo if sound is not users" do
      args = { user_id: user.id, sound_id: sound.id + 1, file_name: "whee.jpg" }
      ctx = { current_user: user }
      subject.fields["create_photo"].resolve(nil, args, ctx)
      expect(Photo.count).to eq(0)
    end
  end
end

RSpec.describe Mutations::PhotoMutation do
  describe "should create a new photo" do
    let!(:user) { create(:user) }
    let!(:sound) { create(:sound, user: user) }
    it "adds a new photo and sound is users" do
      login_as(user, scope: :user)
      args = { filename: "whee.jpg", sound_id: sound.id }
      ctx = { current_user: user }
      subject.fields["create_photo"].resolve(nil, args, ctx)
      expect(Photo.count).to eq(1)
      expect(Photo.last.filename).to eq("whee.jpg")
    end
  end
end

RSpec.describe Mutations::PhotoMutation do
  describe "editing a photo" do
    let!(:user) { create(:user) }
    let!(:sound) { create(:sound, user: user) }
    let!(:photo) { create(:photo, user: user, sound: sound) }

    it "does not update the photo if not logged in" do
      args = sound_args
      ctx = { current_user: nil }
      query_result = subject.fields["edit_photo_filename"].resolve(nil, args, ctx)
      expect(query_result).to eq nil
    end

    it "does not update the photo if not owned by user" do
      args = photo_args
      ctx = { current_user: user }
      args[:id] = args[:id] + 1
      query_result = subject.fields["edit_photo_filename"].resolve(nil, args, ctx)
      expect(query_result).to eq nil
    end

    it "updates the photo" do
      args = photo_args
      ctx = { current_user: user }
      query_result = subject.fields["edit_photo_filename"].resolve(nil, args, ctx)
      expect(query_result.filename).to eq "beepboop.jpg"
    end
  end
end

RSpec.describe Mutations::PhotoMutation do
  describe "deleting a photo" do
    let!(:user) { create(:user) }
    let!(:sound) { create(:sound, user: user) }
    let!(:photo1) { create(:photo, user: user, sound: sound) }
    let!(:photo2) { create(:photo, user: user, sound: sound) }

    it "does not delete photo if not logged in" do
      args = { id: photo1.id }
      ctx = { current_user: nil }
      subject.fields["delete_photo"].resolve(nil, args, ctx)
      expect(Photo.count).to eq 2
    end

    it "does not delete photo if not user photo" do
      args = { id: sound.id + 1 }
      ctx = { current_user: user }
      subject.fields["delete_photo"].resolve(nil, args, ctx)
      expect(Photo.count).to eq 2
    end

    it "deletes photo" do
      args = { id: photo1.id }
      ctx = { current_user: user }
      subject.fields["delete_photo"].resolve(nil, args, ctx)
      expect(Photo.count).to eq 1
      expect(Photo.all).not_to include(photo1)
    end
  end
end

def photo_args
  {
    id: photo.id,
    filename: "beepboop.jpg"
  }
end
