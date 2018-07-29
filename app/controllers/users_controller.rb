class UsersController < ApplicationController
  # Make sure the current_user is authenticated before completing request.
  before_action :authenticate_user,  only: [:index, :current, :update]
  before_action :authorize_as_admin, only: [:destroy]
  before_action :authorize,          only: [:update]

  # GET /users
  def index
    render json: {status: 200, msg: 'Logged-in'}
  end

  # GET /users/1
  def show
    render json: @user
  end

  # Check if the user is logged-in
  def current
    current_user.update!(last_login: Time.now)
    render json: current_user
  end

  # Check if current_user can update itself
  def authorize
    return_unauthorized unless current_user && current_user.can_modify_user?(params[:id])
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: {status: 200, msg: 'User was created.'}
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: { status: 200, msg: 'User details have been updated.' }
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: { status: 200, msg: 'User has been deleted.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
