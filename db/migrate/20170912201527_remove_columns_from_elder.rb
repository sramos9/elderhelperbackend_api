class RemoveColumnsFromElder < ActiveRecord::Migration[5.1]
  def change
    remove_column :elders, :title, :string
    remove_column :elders, :location, :string
    remove_column :elders, :duration, :string
    remove_column :elders, :details, :string
    remove_column :elders, :date_needed, :date


  end
end
