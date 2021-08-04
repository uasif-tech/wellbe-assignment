class TaskItem < ApplicationRecord
  belongs_to :task
  has_many :task_assignments, dependent: :destroy
  has_many :patients, class_name: 'Patient',
                      through: :task_assignments, foreign_key: :task_id,
                      dependent: :destroy, source: :task

  validates :title, :body, :due_days, presence: true
  validates :due_days, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates_length_of :title, minimum: 5, maximum: 100
end
