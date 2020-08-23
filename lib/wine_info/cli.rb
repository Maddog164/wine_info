#require 'pry'
class WineInfo::CLI 
  
  def call 
    puts "Welcome to Wine Info!!"
    WineInfo::API.get_info("petrus","2011")
    
  end
  
  def menu
    
  end
  
  
end