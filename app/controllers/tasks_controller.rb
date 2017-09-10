class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # GET /tasks (why isn't this working?????)
  def index
    @tasks = Task.all
    render json: @tasks.to_json(include: :elder)
    # trying to get the /tasks index route.

    # ************ THIS IS TOO SPECIFIC, AND I THINK IT IS IN THE SET TASK **********
    # elder_id = params[:elder_id]
    # @tasks = Elder.find(elder_id).tasks
    # render json: @tasks
    # **************************************

  end


  # GET /tasks/1
  def show
    render json: @task

  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    # creating a task params id to belong to an elder
    @task.elder_id = params[:elder_id]

    if @task.save
      render json: @task, status: :created #, location: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      render json: @task
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end
  #
  # # DELETE /tasks/1
  def destroy
    @task.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # GET route for elders/id/tasks

    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:task_name, :date_needed, :location, :duration, :details, :phone, :email, :requested_by)
    end
end
