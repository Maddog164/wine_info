#require 'pry'
class WineInfo::CLI

  attr_accessor :message, :wine_desc
  
  def initialize(message="Enter the Wine You Would Like to Look Up",wine_desc=nil)
    @message = message
    menu(message, wine_desc)
  end
  
  def call 
    puts "Welcome to Wine Info!!"
    menu(message, wine_desc)
  end
  
  def menu(message, wine_desc)
    if message == "Here are the results of your search:"
      self.list_wineinfo(klass=WineInfo::Wine,wine_desc)
    else
      puts message
      input = gets.chomp
      #binding.pry
      WineInfo::API.get_info(input)
    end
  end
      
  def list_wineinfo(klass,wine_desc)
    nice_wine_desc = wine_desc.split.map(&:capitalize).join(" ")
    puts "#{nice_wine_desc}"
    binding.pry
    #puts klass.all
    # hash_values = klass.all.values 
    klass.all.each do |value|
      puts "Vintage #{"vintage"}  Average Price: #{"price_avg"}  Wine Score: #{"ws_score"}"
    end
    #klass.all
    #   "#{vintage}, Average Price: #{price_avg}   Wine Score: #{ws_score}"
    # end
  end
  
 
end
