class ChangeAccuracyTypeToF < ActiveRecord::Migration
    def up
        change_column :games, :accuracy, :float
    end

    def down
        change_column :games, :accuracy, :integer
    end
end
