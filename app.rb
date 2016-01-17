require 'rubygems'
require 'sinatra/base'
require 'thin'
require 'em-websocket'


EventMachine.run do

    class SshkeygenApp < Sinatra::Base

        get '/' do
            erb:index
        end

    end

    # Websocket stuff
    @clients = []   
    EM::WebSocket.start(:host => '0.0.0.0',  :port => '3002') do |ws|
        ws.onopen do |handshake|
            @clients << ws
            ws.send "Connected to #{handshake.path}."    
        end

        ws.onclose do 
            ws.send "ws closed"
            @clients.delete ws
        end

        ws.onmessage do |msg|
            puts "got #{msg}"
            if msg == "supreme leader"
                ws.send "Harami"
            elsif msg == "aks"
                ws.send "yo bro"
            else
                es.send "Nice one bro"
            end
        end

    end


    SshkeygenApp.run! :port => 3001 
end
