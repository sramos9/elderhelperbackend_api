class EldersController < ApplicationController
  before_action :set_elder, only: [:show, :update, :destroy]

  # GET /elders
  def index
    @elders = Elder.all

    render json: @elders.to_json(include: :tasks)
  end

  # GET /elders/1
  def show
    render json: @elder.to_json(include: :tasks)
  end

  # POST /elders
  def create
    @elder = Elder.new(elder_params)


    if @elder.save
      render json: @elder, status: :created, location: @elder
    else
      render json: @elder.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /elders/1
  def update
    if @elder.update(elder_params)
      render json: @elder
    else
      render json: @elder.errors, status: :unprocessable_entity
    end
  end

  # DELETE /elders/1
  def destroy
    @elder.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_elder
      @elder = Elder.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def elder_params
      params.require(:elder).permit(:name, :phone, :email)
    end
end
