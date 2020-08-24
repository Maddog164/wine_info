#require 'pry'
class WineInfo::CLI 
  
  def call 
    puts "Welcome to Wine Info!!"
    menu
    
    
  end
  
  def menu(message="Enter the Wine You Would Like to Look Up")
    puts message
    input = gets.chomp
    binding.pry
    WineInfo::API.get_info(input)
    
  end
  
  
end