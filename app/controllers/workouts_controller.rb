class WorkoutsController < ApplicationController
  # Make sure the current_user is authenticated before completing request.
  before_action :authenticate_user,  only: [:index, :show, :create, :update]
  before_action :authorize_as_admin, only: [:destroy]
  before_action :authorize,          only: [:update]

  # GET /workouts
  def index
    @workouts = Workout.all

    render json: @workouts
  end

  # GET /workouts/1
  def show
    @workout = Workout.find(params[:id])
    render json: @workout
  end

  # POST /workouts
  def create
    @workout = Workout.new(workout_params)
    @workout.url = SecureRandom.urlsafe_base64(nil, false)

    if @workout.save
      @workout.exercises << Exercise.where(id: params[:exercise_ids])
      render json: @workout, status: :created, location: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workouts/1
  def update
    @workout = Workout.find(params[:id])
    if @workout.update(workout_params)
      render json: @workout
    else
      render json: @workout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workouts/1
  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
  end

  private

    # Only allow a trusted parameter "white list" through.
    def workout_params
      params.require(:workout).permit(:name, :note)
    end
end
