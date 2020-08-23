require 'pry'
require 'net/http'
require 'open-uri'
require 'json'

class WineInfo::API
  
  attr_accessor :wine_desc, :vintage
  
  def initialize (wine_desc,vintage)
    wine_desc = "molly dooker blue eyed boy"
    vintage = "2"
  end
    
  
  def self.get_info(wine_desc,vintage)
    binding.pry
    url = "https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=#{wine_desc}&vintage=#{vintage}&format=J"
    #url = "https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=petrus&vintage=2011&format=J"
   # url = "https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=molly+dooker&vintage=2&currencycode=USD"
    uri = URI.parse(url)
    #uri = URI.parse('https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=molly+dooker&vintage=2&currencycode=USD')
    response = Net::HTTP.get_response(uri)
    response_hash = JSON.parse(response.body)
    WineInfo::Wine.new(wine_desc,vintage,response_hash)
    #binding.pry 
  end
  
  
end