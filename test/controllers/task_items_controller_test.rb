require 'test_helper'

class TaskItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
    @task_item = task_items(:one)
    @task_item.task = @task
  end

  test 'should get index' do
    get task_task_items_path(@task)
    assert_response :success
  end

  test 'should get new' do
    get new_task_task_item_path(@task)
    assert_response :success
  end

  test 'should create task_item' do
    assert_difference('TaskItem.count') do
      post task_task_items_path(@task), params: { task_item: { body: @task_item.body, due_days: @task_item.due_days, title: @task_item.title } }
    end
    assert_redirected_to task_task_item_path(@task, TaskItem.last)
  end

  test 'should show task_item' do
    get task_task_item_url(@task, @task_item)
    assert_response :success
  end

  test 'should get edit' do
    get edit_task_task_item_path(@task, @task_item)
    assert_response :success
  end

  test 'should destroy task_item' do
    assert_difference('TaskItem.count', -1) do
      delete task_task_item_path(@task, @task_item)
    end

    assert_redirected_to task_task_items_url
  end
end
