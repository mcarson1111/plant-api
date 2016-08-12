class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_create_params[:user])
  end


  private

  def user_create_params
    params.permit(user: [:username, :email, :password, :password_confirmation])
  end
end


# Gotta send user info over url? The password digest thing is a thing, but idk....oauth is better? idk
