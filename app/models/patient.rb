class Patient < ApplicationRecord
  has_many :task_assignments, dependent: :destroy
  has_many :tasks, through: :task_assignments, dependent: :destroy
  has_many :task_items, through: :task_assignments, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validates_format_of :first_name, :last_name, :with => /\A[A-Za-z]*$\z/, multiline: false
end
