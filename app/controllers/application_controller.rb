class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :run_setup

  def run_setup
    set_decoys
  end

  def set_decoys
    @decoys = [
        OpenStruct.new({
                           id: 1,
                           name: "Leroy"
                       }),
        OpenStruct.new({
                           id: 2,
                           name: "Troy"
                       })
    ]
  end
end
