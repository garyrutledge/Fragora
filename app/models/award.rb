class Award < ActiveRecord::Base
    attr_accessible :award_type_id, :user_id
    belongs_to :user
    belongs_to :award_type


end
