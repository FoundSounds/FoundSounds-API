# frozen_string_literal: true

class Photo < ApplicationRecord
  belongs_to :user
  belongs_to :sound
end
