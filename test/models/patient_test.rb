require 'test_helper'

class PatientTest < ActiveSupport::TestCase

  context 'Associations' do
    should have_many(:task_assignments)
    should have_many(:tasks)
  end

  context 'Validation' do
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)

    should allow_value('Alexa').for(:first_name)
    should allow_value('Hales').for(:last_name)

    should_not allow_value('Alexa9').for(:last_name)
    should_not allow_value('Hales9').for(:last_name)
  end


  test 'valid Patient' do
    p = patients(:one)
    assert p.valid?
  end

  test 'invalid without first_name' do
    p = patients(:invalid_first_name)
    refute p.valid?, 'Patient is valid without a name'
    assert_not_nil p.errors[:first_name], 'Validation error message for first name is not present'
  end

  test 'invalid without last_name' do
    p = patients(:invalid_last_name)
    refute p.valid?, 'Patient is valid without a name'
    assert_not_nil p.errors[:last_name], 'Validation error message for last name is not present'
  end
end
