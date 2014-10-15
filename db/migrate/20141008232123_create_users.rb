class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.integer :total_kills
      t.integer :total_deaths
      t.float :kdr
      t.integer :total_headshots
      t.float :average_accuracy

      t.timestamps
    end
  end
end
