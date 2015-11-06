#require 'rails/sse'
require 'reloader/sse'

class PlayersController < ApplicationController
    include ActionController::Live
    
    def index
        @players = Player.all
    end
    
    def new
        @player = Player.new
    end
    
    def create
        @player = Player.new(player_params)
        if @player.save
            session[:player_id] = @player.id
            redirect_to '/flag'
        else
            redirect_to '/signup'
        end
    end
    
    def stream
        response.headers['Content-Type'] = 'text/event-stream'
        sse = Reloader::SSE.new(response.stream)
        begin 
            loop do
                sse.write("sss")
                sleep 5.second
            end
        end
    end
    
    
#   Pevent from mass assignment vulnerabilities
    private
        def player_params
          params.require(:player).permit(:name, :email, :password)
        end

end
