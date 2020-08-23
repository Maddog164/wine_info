#require 'pry'
class WineInfo::CLI 
  
  def call 
    puts "Welcome to Wine Info!!"
    WineInfo::API.get_info("molly dooker blue eyed boy","2")
    
  end
  
  def menu
    
  end
  
  
end