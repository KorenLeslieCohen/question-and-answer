class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    unless current_user == User.find(1)
      redirect_to root_url
    end
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show

    #redirect_to root_url
    #binding.pry
    unless current_user.id == params[:id].to_i
      redirect_to root_url
    end
  end

  # GET /users/new
  def new
    # @user = User.new
    redirect_to root_url
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

end
