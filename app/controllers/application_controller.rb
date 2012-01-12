class ApplicationController < ActionController::Base
  protect_from_forgery
  include CampaignCash
  Base.api_key = "YOUR API KEY"
  
end
