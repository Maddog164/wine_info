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
    # if wine_desc != nil
    #   nice_wine_desc = wine_desc.split.map(&:capitalize).join(" ")
    #   puts "#{nice_wine_desc}"
    i = 0 
    binding.pry
    klass.all.each do |wine_desc|
      puts "#{klass.all[i]["wine_desc"]}.split.map(&:capitalize).join(" ") "
      i += 1
    end #do
      
  #   while i < 4 && klass.all[i] != nil do
  #     if ii = 0 
  #       puts "#{klass.all[0]["wine_desc"]}.split.map(&:capitalize).join(" ")"
  #       ii+=1
  #     end #if
  #     puts "   Vintage #{klass.all[i]["vintage"]}  Average Price: #{klass.all[i]["price_avg"]}  Wine Score: #{klass.all[i]["ws_score"]}"
  #     i+=1
  #   end
  # end
    #binding.pry
    #puts klass.all
    # hash_values = klass.all.values 
    
    #klass.all
    #   "#{vintage}, Average Price: #{price_avg}   Wine Score: #{ws_score}"
    # end
  end
  
  def menu(message, wine_desc)
    if message == "Here are the results of your search:"
      puts message
      list_wineinfo(klass=WineInfo::Wine,wine_desc)
      call
      
    else
      puts message
      wine_input = gets.chomp
      #binding.pry
      WineInfo::API.get_info(wine_input)
    end
  end
  
  def call 
    puts "Wine Info Menu"
    puts "What Would You Like To Do?"
    puts ("1. Perform Wine Search")
    puts ("2. Show Me All Results For This Session")
    puts ("3. Delete a Wine/Producer")
    puts ("9. Quit")
    user_input = gets.chomp
    case user_input
      when "1"
       menu(@message = "Enter the Wine You Would Like to Look Up", wine_desc=nil) 
      when "2"
       list_wineinfo(klass=WineInfo::Wine,wine_desc=nil)
      when "3"
      
      when "9"
        puts "Goodbye . . ."
        'exit'
      else
       call
    end #case
  end #call
    
     
end
