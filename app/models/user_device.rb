# frozen_string_literals: true

class UserDevice < ApplicationRecord
  belongs_to :user
end
