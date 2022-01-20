class TodosController < ApplicationController
  def create
    todo = Todo.create(todo_params)
    render json: todo, status: 201
  end

  private

  def todo_params
    params.permit(:title)
  end
end
