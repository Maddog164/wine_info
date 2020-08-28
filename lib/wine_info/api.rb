require 'pry'
require 'net/http'
require 'open-uri'
require 'json'

class WineInfo::API
  
  attr_accessor :wine_desc, :vintage
  
 
  def self.get_info(wine_desc)
    #binding.pry
    vintage = 2018
    until vintage == 2019 do
      url = "https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=#{wine_desc}&vintage=#{vintage}&format=J"
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      response_hash = JSON.parse(response.body)
      #binding.pry
      if (response_hash["return-code"]) == 1
        WineInfo::CLI.new(message="No Wine Matches Were Found. Please Enter A Valid Producer and Wine")
        elsif (response_hash["return-code"]) == 8
          WineInfo::CLI.new(message="Too Many Matches Were Found. Please Narrow Your Search to a Specific Type of Wine")
        elsif (response_hash["return-code"]) == 0
          WineInfo::Wine.new(wine_desc,vintage,response_hash)
        else
          WineInfo::CLI.new(message="Please Enter a Valid Producer") 
      end #if
      vintage += 1
      #binding.pry 
    end #do
    #binding.pry
    WineInfo::CLI.new(message="Here are the results of your search:",wine_desc)
  end
  
  
end