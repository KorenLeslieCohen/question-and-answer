class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    # redirect_to root_url
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #redirect_to root_url
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

    # Never trust parameters from the scary internet, only allow the white list through.
    # def user_params
    #   params.require(:user).permit(:name, :provider, :uid)
    # end
end
