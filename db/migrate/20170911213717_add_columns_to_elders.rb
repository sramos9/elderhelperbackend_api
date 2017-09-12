class AddColumnsToElders < ActiveRecord::Migration[5.1]
  def change
    add_column :elders, :username, :string
    add_column :elders, :password_digest, :string
  end
end
