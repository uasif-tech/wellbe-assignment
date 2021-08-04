class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = Task.new(task_params)
    return redirect_to tasks_path, notice: t('.index.messages.success_create') if @task.save

    render :new, status: :unprocessable_entity
  end

  def update
    return redirect_to @task, notice: t('.index.messages.success_update') if @task.update(task_params)

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: t('.index.messages.success_destroy')
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name)
  end
end
