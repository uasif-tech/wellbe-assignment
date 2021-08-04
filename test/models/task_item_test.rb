require "test_helper"

class TaskItemTest < ActiveSupport::TestCase

  context 'Associations' do
    should belong_to(:task)
    should have_many(:task_assignments)
    should have_many(:patient_assigned)
  end

  context 'Validation' do
    should validate_presence_of(:title)
    should validate_presence_of(:body)
    should validate_presence_of(:due_days)
    should validate_numericality_of(:due_days)
  end


  test 'valid task_item' do
    p = task_items(:one)
    p.task = tasks(:one)
    assert p.valid?
  end

  test 'invalid task item' do
    p = task_items(:invalid)
    refute p.valid?, 'task item is valid with missing fields'
  end

end
