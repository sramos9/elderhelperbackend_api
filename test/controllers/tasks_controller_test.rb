require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url, as: :json
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { date_needed: @task.date_needed, details: @task.details, duration: @task.duration, email: @task.email, location: @task.location, phone: @task.phone, requested_by: @task.requested_by, task_name: @task.task_name } }, as: :json
    end

    assert_response 201
  end

  test "should show task" do
    get task_url(@task), as: :json
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { date_needed: @task.date_needed, details: @task.details, duration: @task.duration, email: @task.email, location: @task.location, phone: @task.phone, requested_by: @task.requested_by, task_name: @task.task_name } }, as: :json
    assert_response 200
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete task_url(@task), as: :json
    end

    assert_response 204
  end
end
