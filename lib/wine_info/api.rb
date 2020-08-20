require 'net/http'
require 'open-uri'
require 'json'

class WineInfo::API 
  
  def self.get_info
    #uri = URI.parse('https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=petrus&vintage=2011')
    uri = URI.parse('https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=petrus&vintage=2011')
    response = Net::HTTP.get_response(uri)
    response
    binding.pry 
  end
  
  
end