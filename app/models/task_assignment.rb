class TaskAssignment < ApplicationRecord
  belongs_to :patient
  belongs_to :task
  belongs_to :task_item

  validates :task_id, :patient_id, :due_date, presence: true
  validates_date :due_date, on_or_after: -> { Date.current }

  default_scope { order(due_date: :desc) }
end
