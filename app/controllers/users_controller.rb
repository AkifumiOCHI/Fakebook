class UsersController < ApplicationController
  def index
    @users = User.index_all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
end
