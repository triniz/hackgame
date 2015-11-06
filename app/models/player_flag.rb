class PlayerFlag < ActiveRecord::Base
    belongs_to :player
    belongs_to :flag
end
