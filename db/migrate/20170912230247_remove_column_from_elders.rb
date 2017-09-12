class RemoveColumnFromElders < ActiveRecord::Migration[5.1]
  def change
    remove_column :elders, :phone, :string
  end
end
