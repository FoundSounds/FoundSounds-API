# frozen_string_literal: true

# TODO: Change back to ActionController::API
class ApplicationController < ActionController::Base
  protect_from_forgery

  def verify_mobile_token
    return params[:auth_token] == ENV["AUTH_TOKEN"] if params[:auth_token].present?

    false
  end
end
