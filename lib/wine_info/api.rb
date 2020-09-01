
require 'pry'
require 'net/http'
require 'open-uri'
require 'json'

class WineInfo::API
  
  attr_accessor :wine_desc, :vintage
  
 
  def self.get_info(wine_desc)
    #binding.pry
    system("clear")
    puts "Retrieving your information for #{wine_desc}"
    hold_hash_array = []
    vintage = 2015
    continue_var = true
    until vintage == 2019 || continue_var == false do
      url = "https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=#{wine_desc}&vintage=#{vintage}&format=J"
      uri = URI.parse(url)
      response = Net::HTTP.get_response(uri)
      response_hash = JSON.parse(response.body)
      #binding.pry
      hold_hash_array << response_hash
      if (hold_hash_array[0]["return-code"]) != nil &&  (hold_hash_array[0]["return-code"])== 8
        continue_var = false 
        WineInfo::CLI.new.menu(message="Too Many Matches Were Found. Please Narrow Your Search to a Specific Producer",wine_desc=nil)
      end
      vintage += 1
      #binding.pry
    end #do
    #binding.pry
    # response_hash.each do
    vintage = 2015
    i = 0
    while i < 4 && continue_var == true do
      #binding.pry
      if hold_hash_array.length > i && (hold_hash_array[i]["return-code"])==0
          WineInfo::Wine.new(wine_desc,vintage,hold_hash_array[i])
          i += 1
          vintage += 1
        elsif hold_hash_array.length == 4 && (hold_hash_array[i]["return-code"])==1 && (hold_hash_array[i+1]["return-code"]==1) && (hold_hash_array[i+2]["return-code"]==1) && (hold_hash_array[i+3]["return-code"]==1)
          # i += 1
          # vintage += 1
          continue_var = false
          WineInfo::CLI.new.menu(message="Please Enter a Valid Producer",wine_desc=nil)
        end #if
    end #do
    if continue_var == true
      WineInfo::CLI.new.menu(message="Here are the results of your search:",wine_desc)
    end #if
   
  end
  
  
  
end