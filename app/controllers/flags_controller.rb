class FlagsController < ApplicationController
    include ActionController::Live   

    def new
    end
    
    def test
    end
    
    
    def create
        
        @flag = Flag.find_by_value(params[:session][:flag])
        @current_player = Player.find_by_id(session[:player_id])
            
        unless @flag && @current_player.flags.exists?(id: @flag.id)       
            if (@flag && @flag.value == params[:session][:flag])
    
                @current_player.no_flag += 1
                @current_player.timer = @current_player.timer + 600
                @current_player.points += @flag.weight
                @current_player.save
                @current_player.flags << @flag                
                # Streaming results
#                response.headers['Content-Type'] = 'text/event-stream'
#                sse = Reloader::SSE.new(response.stream)
#                begin
#                    sse.write({ :event => "refresh" })
#                    rescue IOError
#                    ensure
#                        sse.close
#                end

#               Display the right Message
                case @flag.id 
                when 1    
                    flash[:notice] = "Well done! You found the Terrorist's NAME" 
                when 2    
                    flash[:notice] = "Well done! You found the CONTINENT" 
                when 3    
                    flash[:notice] = "Well done! You found the COUNTRY" 
                when 4    
                    flash[:notice] = "Well done! You found the CITY" 
                when 5    
                    flash[:notice] = "Well done! You found the STREET NAME" 
                when 6    
                    flash[:notice] = "Well done! You found the STREET NUMBER" 
                when 7    
                    flash[:notice] = "Well done! You found the ZIP CODE" 
                when 8    
                    flash[:notice] = "Well done! You found the BOMB CODE" 
                end 
 
                redirect_to @flag
                
            else
                flash[:alert] = "Wrong flag !!"                
                redirect_to '/flag'
            end 
            
        else 
                flash[:alert] = "Flag already submitted !!"                
                redirect_to '/flag'
        end

    end 
    
    
end
