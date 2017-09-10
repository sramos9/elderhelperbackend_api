class CreateElders < ActiveRecord::Migration[5.1]
  def change
    create_table :elders do |t|
      t.string :name
      t.string :title
      t.string :location
      t.string :duration
      t.string :details
      t.date :date_needed
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
