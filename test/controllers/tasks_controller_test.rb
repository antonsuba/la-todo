require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @todo = @task.todo
  end

  test "should get index" do
    get todo_tasks_url(@todo), as: :json
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post todo_tasks_url(@todo), params: { title: "task_test", content: "sample task content" }, as: :json
    end

    assert_response 201
  end

  test "should show task" do
    get todo_task_url(@todo, @task), as: :json
    assert_response :success
  end

  test "should update task" do
    put todo_task_url(@todo, @task), params: { task: {  } }, as: :json
    assert_response 200
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete todo_task_url(@todo, @task), as: :json
    end

    assert_response 204
  end
end
