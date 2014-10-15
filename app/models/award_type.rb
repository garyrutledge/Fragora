class AwardType < ActiveRecord::Base
  attr_accessible :name
    has_many :awards
    has_many :users, :through => :awards
end
