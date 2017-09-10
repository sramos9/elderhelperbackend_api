class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.date :date_needed
      t.string :location
      t.string :duration
      t.string :details
      t.string :phone
      t.string :email
      t.string :requested_by

      t.timestamps
    end
  end
end
