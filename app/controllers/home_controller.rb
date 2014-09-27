class HomeController < ApplicationController
  def index
    if current_user
      redirect_to decoys_path
    end
  end
end
