require 'sinatra'
require "sinatra/reloader"
require 'chronic'

class FrontEndParty < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    next_meeting = Chronic.parse "October 24th, 2013"
    # current_month = Time.now.strftime "%B"
    # unless next_meeting = Chronic.parse("fifth Thursday in #{current_month}")
    #   next_meeting = Chronic.parse "fourth Thursday in #{current_month}"
    # end
    erb :index, :locals => {:next_meeting => next_meeting.strftime("%B %e, %Y") }
  end
end