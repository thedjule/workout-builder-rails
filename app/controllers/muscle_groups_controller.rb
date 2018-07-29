class MuscleGroupsController < ApplicationController
  before_action :set_muscle_group, only: [:show, :update, :destroy]

  # GET /muscle_groups
  def index
    @muscle_groups = MuscleGroup.all

    render json: @muscle_groups
  end

  # GET /muscle_groups/1
  def show
    render json: @muscle_group
  end

  # POST /muscle_groups
  def create
    @muscle_group = MuscleGroup.new(muscle_group_params)

    if @muscle_group.save
      render json: @muscle_group, status: :created, location: @muscle_group
    else
      render json: @muscle_group.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /muscle_groups/1
  def update
    if @muscle_group.update(muscle_group_params)
      render json: @muscle_group
    else
      render json: @muscle_group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /muscle_groups/1
  def destroy
    @muscle_group.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_muscle_group
      @muscle_group = MuscleGroup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def muscle_group_params
      params.require(:muscle_group).permit(:name)
    end
end
