class CreateTaskAssignments < ActiveRecord::Migration[6.1]
  def change
    create_table :task_assignments do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.references :task_item, null: false, foreign_key: true
      t.date :due_date
      t.boolean :is_completed, default: false

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
