#require "pry"
#require "rest-client"
require "json"

require_relative "./wine_info/version"
require_relative "./wine_info/cli"
require_relative "./wine_info/api"
require_relative "./wine_info/wine"
require_relative "./wine_info/vintage"


module WineInfo
  class Error < StandardError
  end
  
end

