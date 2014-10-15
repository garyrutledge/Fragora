# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sample_usernames = %w(UltimateLurker blurtpassionate guidegrovel policemaninfinite crumblydie cuddlyaffirm snarlmemorable wildebeestinnate rightgo flyingshark)
sample_awards = ["Fast Kill", "Headshot King", "Walk In The Park", "Solid Sailor", "Loop De Loop", "Dead Man Walking", "Suicide Surrender", "No Treat For You", "Good Doggie", "Womp Womp"]
rounds = (1..10).to_a

10.times do
    User.create(:username => sample_usernames.pop, :email => "user#{rand(9)}@fragora.com", :total_kills => rand(100), :total_deaths => (1 + rand(100)), :total_headshots => rand(100))
end

10.times do
    AwardType.create(:name => sample_awards.pop)
end

User.all.each do |user|
    x = []
    AwardType.all.each { |award| x << award.id }
    random_awards_id = x
    (1+ rand(9)).times do
        Award.create(:user_id => user.id, :award_type_id => random_awards_id.pop)
    end
end

rounds.each do |round|
    x = []
    User.all.each { |user| x << user.id }
    five_sample_users = x.sort{ rand() - 0.5 }[0..5]
    5.times do
        g = Game.new(:round => round, :user_id => five_sample_users.pop, :deaths => rand(100), :headshots => rand(6)   )
        g.shots_fired = rand(100)
        g.shots_hit = ((0..(g.shots_fired)).to_a.sample) # Random number thats never higher than shots_fired
        g.kill = ((0..(g.shots_fired)).to_a.sample) # Random number thats never higher than shots_fired
        g.save
    end
end
