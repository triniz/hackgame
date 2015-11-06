class SessionsController < ApplicationController
    
    def new
    end
    
    def create
        @player = Player.find_by_email(params[:session][:email].downcase)
        if @player && @player.password == params[:session][:password]
            session[:player_id] = @player.id
            redirect_to '/flag'
        else
            redirect_to '/login'
        end 
    end
        
    def destroy 
        session[:player_id] = nil 
        redirect_to '/' 
    end
end

