#require 'pry'
class WineInfo::CLI 
  
  def call 
    puts "Welcome to Wine Info!!"
    WineInfo::API.get_info
    
  end
  
  def menu
    
  end
  
  
end