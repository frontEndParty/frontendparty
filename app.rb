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

  def submission_form_url
    # joe's
    "https://docs.google.com/a/joeellis.la/spreadsheet/viewform?formkey=dC1SQlBHdU5yS2xKODR0bjR5QTFENHc6MQ"
    # shwery's
    # "https://docs.google.com/forms/d/1xz8g9apBkmW5g8v-E8nmD_Hjriv3e31urZc2zU4VWxY/viewform"
  end

  get "/" do
    erb :index, :locals => {:next_meeting => next_meeting("February 26 2015").strftime("%B %e, %Y") }
  end

  get "/apply" do
    redirect to(submission_form_url)
  end
end
