class ApplicationController < ActionController::Base
  protect_from_forgery
  include CampaignCash
  Base.api_key = "a8f4ea3f470c1d34624dba962ff0bab0:14:63273396"
  
end
