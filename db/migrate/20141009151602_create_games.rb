class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.integer :kill
      t.integer :deaths
      t.integer :shots_fired
      t.integer :shots_hit
      t.integer :accuracy
      t.integer :headshots

      t.timestamps
    end
  end
end
