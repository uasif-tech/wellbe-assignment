class Task < ApplicationRecord
  has_many :task_items, dependent: :destroy
  has_many :task_assignments, dependent: :destroy
  has_many :patients, class_name: 'Patient', through: :task_assignments,
           foreign_key: :patient_id, dependent: :destroy

  validates :task_name, presence: true
end
