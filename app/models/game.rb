class Game < ActiveRecord::Base
    attr_accessible :deaths, :headshots, :kill, :shots_fired, :shots_hit, :user_id, :accuracy, :round
    belongs_to :user
    before_save :update_accuracy, :update_user_stats

    def update_accuracy
        if self.shots_fired == 0
            self.accuracy = 0
        else
            self.accuracy = calculate_accuracy(self.shots_hit, self.shots_fired)
        end
    end

    def calculate_accuracy(shots_hit, shots_fired)
        (shots_hit.to_f / shots_fired.to_f).round(2) * 100
    end

    def update_user_stats
        unless self.user.nil?
            self.user.total_deaths = (self.user.total_deaths + self.deaths)
            self.user.total_headshots = (self.user.total_headshots + self.headshots)
            self.user.total_kills = (self.user.total_kills + self.kill)
            self.user.average_accuracy = avg_accuracy_stats(self.user.games)
            self.user.save
        end
    end

    def avg_accuracy_stats(users_games)
        x = []
        users_games.each do |users_game|
            x << users_game.accuracy
        end
        x = [0] if x.empty?
        x.inject { |sum, el| sum + el }.to_f / x.size
    end


end
