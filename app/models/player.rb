class Player < ActiveRecord::Base
    has_many :player_flags
    has_many :flags, through: :player_flags  

end
