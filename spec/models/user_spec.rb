require 'rails_helper'

RSpec.describe User, :type => :model do

    context "if user has never played a game" do
        describe "last_played" do
            user = User.create(username: "example", email: "user@fragora.com", total_kills: 100, total_deaths: 100, total_headshots: 100)
            user.last_played.should == "Never"
        end
    end

    context "if user has a game before" do
        describe "last_played" do
            user = User.create(username: "example", email: "user@fragora.com", total_kills: 100, total_deaths: 100, total_headshots: 100)
            game = Game.create(user_id: user.id, kill: 14, deaths: 53, shots_fired: 20, shots_hit: 10, headshots: 4, round: 1)
            user.last_played.should == game.created_at.strftime("%d %b %Y")
        end
    end

    context "if new user create has no values" do

        describe "for total_kills, attribute should default to zero" do
            user = User.create(username: "example", email: "user@fragora.com", total_deaths: 100, total_headshots: 100)
            user.total_kills.should == 0
        end

        describe "for total_deaths, attribute should default to zero" do
            user = User.create(username: "example", email: "user@fragora.com", total_kills: 100, total_headshots: 100)
            user.total_deaths.should == 0
        end

        describe "for total_headshots, attribute should default to zero" do
            user = User.create(username: "example", email: "user@fragora.com", total_deaths: 100, total_kills: 100)
            user.total_headshots.should == 0
        end

    end


    context "if new user create has values" do

        describe "for total_kills, attribute should show values" do
            user = User.create(username: "example", email: "user@fragora.com", total_kills: 100, total_deaths: 100, total_headshots: 100)
            user.total_kills.should == 100
        end

        describe "for total_deaths, attribute should show values" do
            user = User.create(username: "example", email: "user@fragora.com", total_deaths: 100, total_kills: 100, total_headshots: 100)
            user.total_deaths.should == 100
        end

        describe "for total_headshots, attribute should show values" do
            user = User.create(username: "example", email: "user@fragora.com", total_deaths: 100, total_kills: 100, total_headshots: 100)
            user.total_headshots.should == 100
        end

    end


    context "with natural numbers" do
        describe "calculate_kdr should correctly calculate kdr" do
            user = User.create(username: "example", email: "user@fragora.com", total_deaths: 100, total_kills: 200, total_headshots: 100)

            user.calculate_kdr
            user.kdr.should == 2.0
        end
    end
    context "with zero shots fired" do
        describe "calculate_kdr should output zero" do
            user = User.create(username: "example", email: "user@fragora.com", total_deaths: 0, total_kills: 0, total_headshots: 100)

            user.calculate_kdr
            user.kdr.should == 0.0
        end
    end
end