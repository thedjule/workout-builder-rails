class ExercisesController < ApplicationController
  # Make sure the current_user is authenticated before completing request.
  before_action :authenticate_user,  only: [:index, :show]
  before_action :authorize_as_admin, only: [:create, :update, :destroy]
  before_action :authorize,          only: [:update]

  # GET /exercises
  def index
    @exercises = Exercise.all

    render json: @exercises
  end

  # GET /exercises/1
  def show
    @exercise = Exercise.find(params[:id])
    render json: @exercise
  end

  # POST /exercises
  def create
    @exercise = Exercise.new(exercise_params)

    if @exercise.save
      render json: @exercise, status: :created, location: @exercise
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exercises/1
  def update
    @exercise = Exercise.find(params[:id])
    if @exercise.update(exercise_params)
      render json: @exercise
    else
      render json: @exercise.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exercises/1
  def destroy
    @exercise = Exercise.find(params[:id])
    @exercise.destroy
  end

  private

    # Only allow a trusted parameter "white list" through.
    def exercise_params
      params.require(:exercise).permit(:exercise_type_id, :name, :image, :video, :description)
    end
end
