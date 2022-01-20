require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = todos(:one)
  end

  test "should create todo" do
    assert_difference('Todo.count') do
      post todos_url, params: { title: "test_todo" }, as: :json
    end

    assert_response 201
  end
end
