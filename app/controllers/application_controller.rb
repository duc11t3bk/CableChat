class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def after_sign_in_path_for resource
    stored_location_for(resource) || chat_rooms_path
  end

  def after_sign_out_path_for resource
    stored_location_for(resource) || new_user_session_path
  end
end