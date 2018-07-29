class ExerciseTypesController < ApplicationController
  # Make sure the current_user is authenticated before completing request.
  before_action :authenticate_user,  only: [:index, :show]
  before_action :authorize_as_admin, only: [:create, :update, :destroy]
  before_action :authorize,          only: [:update]

  # GET /exercise-types
  def index
    @exercise_types = ExerciseType.all

    render json: @exercise_types
  end

  # GET /exercise-types/1
  def show
    @exercise_type = ExerciseType.find(params[:id])
    render json: @exercise_type
  end

  # POST /exercise-types
  def create
    @exercise_type = ExerciseType.new(exercise_type_params)

    if @exercise_type.save
      render json: @exercise_type, status: :created, location: @exercise_type
    else
      render json: @exercise_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exercise-types/1
  def update
    @exercise_type = ExerciseType.find(params[:id])
    if @exercise_type.update(exercise_type_params)
      render json: @exercise_type
    else
      render json: @exercise_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exercise-types/1
  def destroy
    @exercise_type = ExerciseType.find(params[:id])
    @exercise_type.destroy
  end

  private

    # Only allow a trusted parameter "white list" through.
    def exercise_type_params
      params.require(:exercise_type).permit(:name)
    end
end
