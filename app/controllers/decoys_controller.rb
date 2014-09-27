class DecoysController < ApplicationController
  def index
    # TODO Fetch from googleDoc
  end


  def show
    session[:decoy] = params[:id]
    redirect_to issues_path
  end
end