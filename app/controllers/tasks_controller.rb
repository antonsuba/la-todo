class TasksController < ApplicationController
  before_action :load_todo
  before_action :load_task, only: %i[show update reposition]

  def create
    task = @todo.tasks.create(task_params)
    render json: task, status: 201
  end

  def update
    @task.update(task_params)
    render json: @task
  end

  def destroy
    @task.destroy
  end

  def index
    tasks = @todo.tasks.select("id, title, content, pos_num * 1.0 / pos_den as pos").order("pos asc")
    render json: tasks
  end

  def show
    render json: @task
  end

  def reposition
    prev_task = Task.find_by(id: params[:prev_id])
    next_task = Task.find_by(id: params[:next_id])

    if prev_task.nil? && next_task.nil?
      render json: { error: "At least one existing adjacent task is required" }, status: 400
    else
      pos_num, pos_den = Task.calculate_position(
        num_l: prev_task&.pos_num || 0,
        den_l: prev_task&.pos_den || 1,
        num_h: next_task&.pos_num || 1,
        den_h: next_task&.pos_den || 0
      )

      @task.update(pos_num: pos_num, pos_den: pos_den)

      render json: @task.reload
    end
  end

  private

  def load_todo
    @todo = Todo.find(params[:todo_id])
  end

  def load_task
    @task = @todo.tasks.find(params[:id])
  end

  def task_params
    params.permit(:title, :content)
  end
end
