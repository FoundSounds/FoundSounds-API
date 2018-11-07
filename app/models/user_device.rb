# frozen_string_literal: true

class UserDevice < ApplicationRecord
  belongs_to :user
end
