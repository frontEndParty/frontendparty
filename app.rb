require 'sinatra'
require "sinatra/reloader"
require 'chronic'

class FrontEndParty < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  def next_meeting custom_date
    if custom_date
      next_meeting = Chronic.parse custom_date
    else
      current_month = Time.now.strftime "%B"
      unless next_meeting = Chronic.parse("fifth Thursday in #{current_month}")
        next_meeting = Chronic.parse "fourth Thursday in #{current_month}"
      end
    end
  end

  get "/" do
    erb :index, :locals => {:next_meeting => next_meeting("October 24th 2013").strftime("%B %e, %Y") }
  end
end