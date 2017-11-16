# 
class ApiController < ApplicationController
  layout nil
  
  before_filter :validate_api_key

  # All maps in system
  def index
    @maps = Map.all
  end

  
  # All warped maps in system
  def warped
    @maps = Map.warped
  end

  # Specific details about a map
  def map

  end
  

  private

  # Ensures API key exists, and is valid.
  # leverage active record exception if can't find key.
  #
  # Expect an API key in X-API-KEY
  def validate_api_key
    # Rails automatically underscores the dashes...
    Apikey.find_by! key: request.headers["HTTP_X_API_KEY"], enabled: true
  end

  
end
