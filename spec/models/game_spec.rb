require 'rails_helper'


RSpec.describe Game, :type => :model do

    context "with natural numbers" do
        describe "update_accuracy should correctly calculate accuracy" do
            user = User.create(username: "example", email: "user@fragora.com", total_kills: 100, total_deaths: 100, total_headshots: 100)
            game = Game.create(user_id: user.id, kill: 14, deaths: 53, shots_fired: 20, shots_hit: 10, headshots: 4, round: 1)
            game.update_accuracy
            game.accuracy.should == 50.0
        end
    end
    context "with zero shots fired" do
        describe "update_accuracy should output zero" do
            user = User.create(username: "example", email: "user@fragora.com", total_kills: 100, total_deaths: 100, total_headshots: 100)
            game = Game.create(user_id: user.id, kill: 14, deaths: 53, shots_fired: 0, shots_hit: 00, headshots: 4, round: 1)
            game.update_accuracy
            game.accuracy.should == 0
        end
    end

    describe "after its game object saves update_user_stats should correctly update" do

        describe "total headshots" do
            user = User.create(username: "example", email: "user@fragora.com", total_kills: 100, total_deaths: 100, total_headshots: 100)
            game = Game.create(user_id: user.id, kill: 50, deaths: 50, shots_fired: 20, shots_hit: 10, headshots: 50, round: 1)
            game.user.total_headshots.should == 150
        end
        describe "total kills" do
            user = User.create(username: "example", email: "user@fragora.com", total_kills: 100, total_deaths: 100, total_headshots: 100)
            game = Game.create(user_id: user.id, kill: 50, deaths: 50, shots_fired: 20, shots_hit: 10, headshots: 50, round: 1)
            game.user.total_kills.should == 150

        end
        describe "total deaths" do
            user = User.create(username: "example", email: "user@fragora.com", total_kills: 100, total_deaths: 100, total_headshots: 100)
            game = Game.create(user_id: user.id, kill: 50, deaths: 50, shots_fired: 20, shots_hit: 10, headshots: 50, round: 1)
            game.user.total_deaths.should == 150
        end
    end

end
