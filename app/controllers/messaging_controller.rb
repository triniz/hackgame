require 'reloader/sse'

class MessagingController < ApplicationController
  include ActionController::Live

  def send_message
    response.headers['Content-Type'] = 'text/event-stream'
    sse = Reloader::SSE.new(response.stream)
    begin
      loop do
           ActiveSupport::Notifications.subscribe 'update' do |name, start, finish, id, payload|
           sse.write("Hello")
           puts "update"
           end
      sleep 1

    end
    rescue IOError
    ensure
      sse.close
    end
  end

    def reception
       ActiveSupport::Notifications.subscribe "update" do |name, start, finish, id, payload|
       puts ("test")
       end
    end

end
