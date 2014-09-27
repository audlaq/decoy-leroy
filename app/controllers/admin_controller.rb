class AdminController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def show

  end

  def create
    unless params[:admin_passcode] == ENV[:admin_passcode]
      redirect_to admin_index_path
      return
    end

    user = User.find_by_name(params[:username])
    unless user
      redirect_to admin_index_path
      return
    end

    decoy = params[:decoy].to_sym
    unless User.decoys.includes?(decoy)
      redirect_to admin_index_path
      return
    end

    if user.update(decoy: decoy)
      redirect_to admin_index_path
      return
    end
  end
end