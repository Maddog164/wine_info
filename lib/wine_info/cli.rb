#require 'pry'
class WineInfo::CLI 
  
  def call 
    puts "Welcome to Wine Info!!"
    WineInfo::API.get_info("domaine durand reserve sancerre","2017")
    
  end
  
  def menu
    
    
    
  end
  
  
end