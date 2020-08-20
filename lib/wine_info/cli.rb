#require 'pry'
class WineInfo::CLI 
  
  def call 
    puts "Welcome to Wine Info!!"
    WINEINFO::API.get_categories
    
  end
  
  def menu
    
  end
  
  
end