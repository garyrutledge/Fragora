class User < ActiveRecord::Base
    attr_accessible :average_accuracy, :email, :kdr, :total_deaths, :total_headshots, :total_kills, :username
    has_many :games
    has_many :awards
    has_many :award_types, :through => :awards
    validates_presence_of :email, :username
    validates_format_of :email, :with => /\A([^@\s]+)@([-a-zA-Z0-9]+\.)+[a-zA-Z]+\Z/
    before_save :default_blanks_to_zero, :calculate_kdr

    def calculate_kdr

        if self.total_deaths == 0
            self.kdr = self.total_kills #avoiding dividing by zero
        else
            self.kdr = (self.total_kills.to_f / self.total_deaths.to_f).round(2)
        end

    end

    def default_blanks_to_zero
        self.total_kills = self.total_kills.presence || 0
        self.total_deaths = self.total_deaths.presence || 0
        self.average_accuracy = self.average_accuracy.presence || 0
        self.total_headshots = self.total_headshots.presence || 0
    end

    def last_played
        if self.games.blank?
            "Never"
        else
            self.games.last.created_at.strftime("%d %b %Y")
        end

    end

end
