# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  has_many :sounds
  has_many :photos
  has_many :likes
  has_many :user_devices
  has_many :sound_logs

  validates :username, presence: true, uniqueness: { case_sensitive: false }
end
