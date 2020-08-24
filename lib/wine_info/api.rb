require 'pry'
require 'net/http'
require 'open-uri'
require 'json'

class WineInfo::API
  
  attr_accessor :wine_desc, :vintage
  
  # def initialize (wine_desc,vintage)
  #   wine_desc = "molly dooker blue eyed boy"
  #   vintage = "2"
  # end
    
  
  def self.get_info(wine_desc)
    binding.pry
    vintage = 2015
    until vintage == 2019 do
      url = "https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=#{wine_desc}&vintage=#{vintage}&format=J"
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      response_hash = JSON.parse(response.body)
      if response_hash["return-code"]== "1"
        WineInfo::Cli.menu(message="No Wine Matches Were Found. Please Enter A Valid Producer and Wine")
        elsif response_hash["return-code"]== "8"
          WineInfo::Cli.menu(message="Too Many Matches Were Found. Please Narrow Your Search to a Specific Type of Wine")
        elsif response_hash["return-code"]== "0"
          WineInfo::Wine.new(wine_desc,vintage,response_hash)
        else
          WineInfo::Cli.menu(message="Please Enter a Valid Producer") 
      #binding.pry 
    end #do
  end
  
  
end