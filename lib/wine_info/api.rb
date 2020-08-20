require 'pry'
require 'net/http'
require 'open-uri'
require 'json'

class WineInfo::API 
  
  def self.get_info
    url = "https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=petrus&vintage=2011"
   # url = "https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=molly+dooker&vintage=2&currencycode=USD"
    uri = URI.parse(url)
    #uri = URI.parse('https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=molly+dooker&vintage=2&currencycode=USD')
    response = Net::HTTP.get_response(uri)
    response.body
    binding.pry 
  end
  
  
end