require 'rubygems'
require 'sinatra/base'


class SshkeygenApp < Sinatra::Base

    get '/' do
        send_file '/media/aks/progs/Dropbox/stuff/48_animations_dribbble.gif'
    end

end

