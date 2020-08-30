#require 'pry'
class WineInfo::CLI

  attr_accessor :message, :wine_desc
  
  # def initialize(message="Enter the Wine You Would Like to Look Up",wine_desc=nil)
  #   @message = message
  #   menu(message, wine_desc)
  # end
  
  # def call 
  #   puts "Welcome to Wine Info!!"
  #   @message = "Enter the Wine You Would Like to Look Up"
  #   binding.pry
  #   self.menu(@message, wine_desc=nil)
  # end
  
  # def menu(message, wine_desc)
  #   if message == "Here are the results of your search:"
  #     puts message
  #     list_wineinfo(klass=WineInfo::Wine,wine_desc)
  #   else
  #     puts message
  #     input = gets.chomp
  #     #binding.pry
  #     WineInfo::API.get_info(input)
  #   end
  # end
      
  def list_wineinfo(klass,wine_desc)
    nice_wine_desc = wine_desc.split.map(&:capitalize).join(" ")
    puts "#{nice_wine_desc}"
    #binding.pry
    #puts klass.all
    # hash_values = klass.all.values 
    i = 0 
    while i < 5 && klass.all[i] != nil do
      puts "Vintage #{klass.all[i]["vintage"]}  Average Price: #{klass.all[i]["price_avg"]}  Wine Score: #{klass.all[i]["ws_score"]}"
      i+=1
    end
    #klass.all
    #   "#{vintage}, Average Price: #{price_avg}   Wine Score: #{ws_score}"
    # end
  end
  
  def menu(message, wine_desc)
    if message == "Here are the results of your search:"
      puts message
      list_wineinfo(klass=WineInfo::Wine,wine_desc)
    else
      puts message
      input = gets.chomp
      #binding.pry
      WineInfo::API.get_info(input)
    end
  end
  
  def call 
    puts "Welcome to Wine Info!!"
    @message = "Enter the Wine You Would Like to Look Up"
    binding.pry
    menu(@message, wine_desc=nil)
  end
  
 
end
