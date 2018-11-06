# frozen_string_literal: true

class Sound < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :likes
end
