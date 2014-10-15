class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.integer :user_id
      t.integer :award_type_id

      t.timestamps
    end
  end
end
