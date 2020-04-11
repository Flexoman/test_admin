class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :show_session

  def show_session
    ap session.keys
    ap session.values
  end

end
