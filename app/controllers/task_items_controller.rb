# frozen_string_literal: true

class TaskItemsController < ApplicationController
  before_action :set_task
  before_action :set_task_item, except: :index

  def index
    @task_items = @task.task_items.all
  end

  def show; end

  def edit; end

  def create
    @task_item = @task.task_items.new(task_item_params)
    if @task_item.save
      return redirect_to task_task_items_path(@task),
                         notice: t('.index.messages.success_create')
    end

    render :new, status: :unprocessable_entity
  end

  def update
    if @task_item.update(task_item_params)
      return redirect_to @task_item,
                         notice: t('.index.messages.success_update')
    end

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @task_item.destroy
    redirect_to task_task_items_url,
                notice: t('.index.messages.success_destroy')
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_task_item
    @task_item = TaskItem.find_by_id(params[:id]) || @task.task_items.new
  end

  def task_item_params
    params.require(:task_item).permit(%i[title body due_days task_references])
  end
end
