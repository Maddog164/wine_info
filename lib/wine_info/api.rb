require 'pry'
require 'net/http'
require 'open-uri'
require 'json'

class WineInfo::API
  
  attr_accessor :wine_desc, :vintage
  
 
  def self.get_info(wine_desc)
    #binding.pry
    hold_hash_array = []
    vintage = 2018
    until vintage == 2019 do
      # url = "https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=#{wine_desc}&vintage=#{vintage}&format=J"
      # uri = URI.parse(url)
      # response = Net::HTTP.get_response(uri)
      # response_hash = JSON.parse(response.body)
      #binding.pry
      hold_hash_array = {"return-code"=>1, "return-comment"=>"No matching wines", "list-count"=>0}
      #hold_hash_array << response_hash
      vintage += 1
    end #do
    binding.pry
    # response_hash.each do
    if (hold_hash_array[0]["return-code"]) != nil &&  (hold_hash_array[0]["return-code"])== 8
        WineInfo::CLI.menu(message="Too Many Matches Were Found. Please Narrow Your Search to a Specific Producer",wine_desc=nil)
      elsif hold_hash_array.length > 0 && (hold_hash_array[0]["return-code"]) != nil && (hold_hash_array[0]["return-code"])==0
        WineInfo::Wine.new(wine_desc,vintage=2015,hold_hash_array[0])
      elsif hold_hash_array.length > 1 && (hold_hash_array[1]["return-code"])!= nil && (hold_hash_array[1]["return-code"])==0
        WineInfo::Wine.new(wine_desc,vintage=2016,hold_hash_array[1])
      elsif hold_hash_array.length > 2 && (hold_hash_array[2]["return-code"])!= nil && (hold_hash_array[2]["return-code"])==0
        WineInfo::Wine.new(wine_desc,vintage=2017,hold_hash_array[2])
      elsif hold_hash_array.length >3 && (hold_hash_array[3]["return-code"])!= nil && (hold_hash_array[3]["return-code"])==0
        WineInfo::Wine.new(wine_desc,vintage=2018,hold_hash_array[3])
      else WineInfo::CLI.menu(message="Please Enter a Valid Producer",wine_desc=nil) 
    end
      
      # WineInfo::CLI.new(message="No Wine Matches Were Found. Please Enter A Valid Producer and Wine")
      # elsif (response_hash["return-code"]) == 8
      #   WineInfo::CLI.new(message="Too Many Matches Were Found. Please Narrow Your Search to a Specific Type of Wine")
      # elsif (response_hash["return-code"]) == 0
      #   WineInfo::Wine.new(wine_desc,vintage,response_hash)
      # else
      #   WineInfo::CLI.new(message="Please Enter a Valid Producer") 
      # end #if
      
    #binding.pry 
    #binding.pry
    WineInfo::CLI.new(message="Here are the results of your search:",wine_desc)
  end
  
  
end