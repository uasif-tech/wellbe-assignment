class CreateTaskItems < ActiveRecord::Migration[6.1]
  def change
    create_table :task_items do |t|
      t.string :title
      t.string :body
      t.string :due_days
      t.references :task, foreign_key: true


      t.datetime :deleted_at
      t.timestamps
    end
  end
end
