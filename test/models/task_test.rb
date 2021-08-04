require "test_helper"

class TaskTest < ActiveSupport::TestCase
  context 'Associations' do
    should have_many(:task_items)
    should have_many(:task_assignments)
  end

  context 'Validation' do
    should validate_presence_of(:task_name)
  end


  test 'valid task' do
    task = tasks(:one)
    assert task.valid?
  end

  test 'invalid task' do
    task = tasks(:invalid)
    refute task.valid?, 'Task is valid without a task name'
    assert_not_nil task.errors[:task_name], 'Validation error message for task name is not present'
  end
end
