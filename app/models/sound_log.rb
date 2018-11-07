# frozen_string_literal: true

class SoundLog < ApplicationRecord
  belongs_to :user
  belongs_to :sound
end
