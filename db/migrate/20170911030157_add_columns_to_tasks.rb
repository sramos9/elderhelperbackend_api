class AddColumnsToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :volunteer_name, :string
    add_column :tasks, :volunteer_phone, :string
    add_column :tasks, :volunteer_email, :string
  end
end
