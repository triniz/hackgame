class Flag < ActiveRecord::Base
    has_many :player_flags
    has_many :players, through: :player_flags  
end

