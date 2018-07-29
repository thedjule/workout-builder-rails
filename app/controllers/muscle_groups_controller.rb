class MuscleGroupsController < ApplicationController
  # Make sure the current_user is authenticated before completing request.
  before_action :authenticate_user,  only: [:index, :show]
  before_action :authorize_as_admin, only: [:create, :update, :destroy]
  before_action :authorize,          only: [:update]

  # GET /muscle_groups
  def index
    @muscle_groups = MuscleGroup.all

    render json: @muscle_groups
  end

  # GET /muscle_groups/1
  def show
    @muscle_group = MuscleGroup.find(params[:id])
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
    @muscle_group = MuscleGroup.find(params[:id])
    if @muscle_group.update(muscle_group_params)
      render json: @muscle_group
    else
      render json: @muscle_group.errors, status: :unprocessable_entity
    end
  end

  # DELETE /muscle_groups/1
  def destroy
    @muscle_group = MuscleGroup.find(params[:id])
    @muscle_group.destroy
  end

  private

    # Only allow a trusted parameter "white list" through.
    def muscle_group_params
      params.require(:muscle_group).permit(:name)
    end
end
