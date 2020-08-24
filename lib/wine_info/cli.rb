#require 'pry'
class WineInfo::CLI 
  
  def call 
    puts "Welcome to Wine Info!!"
    menu
    
    
  end
  
  def menu(message="Enter the Wine You Would Like to Look Up")
    puts message
    input = gets(wine_desc)
        WineInfo::API.get_info(wine_desc)
    
  end
  
  
end