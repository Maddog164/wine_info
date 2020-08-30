#require 'pry'
class WineInfo::CLI

  attr_accessor :message, :wine_desc
  
    def list_wineinfo(klass,wine_desc)
      i = 0 
      #binding.pry
      hold_wine_desc = ""
      klass.all.each do |wine_desc|
      #binding.pry
      # if wine_desc == nil || wine_desc == klass.all[i]["wine_desc"]
        if hold_wine_desc != klass.all[i]["wine_desc"]
          puts ("Wine Description #{klass.all[i]["wine_desc"].split.map(&:capitalize).join(" ")}")
          hold_wine_desc = klass.all[i]["wine_desc"]
        end #if
        puts ("   #{klass.all[i]["vintage"]}  Average Price  #{klass.all[i]["price_avg"]}   Score: #{klass.all[i]["ws_score"]}")
        #puts "#{klass.all[i]["wine_desc"]}"
      #end #if
        i += 1
    end #do
    puts "PRESS ANY KEY TO RETURN TO MENU"
    wine_detals_enter = gets.chomp
    system("clear")
    
  end 
    #call
    
  def menu(message, wine_desc)
    if message == "Here are the results of your search:"
      puts message
      list_wineinfo(klass=WineInfo::Wine,wine_desc)
      #call
    else
      puts message
      wine_input = gets.chomp
      #binding.pry
      WineInfo::API.get_info(wine_input)
    end #if
  end
  
  def call
    kp_proc = true
    while kp_proc==true do
      puts "Wine Info Menu"
      puts "What Would You Like To Do?"
      puts ("1. Perform Wine Search")
      puts ("2. Show Me All Results For This Session")
      puts ("3. Delete a Wine/Producer")
      puts ("9. Quit")
      user_input = gets.chomp
      system("clear")
      case user_input
        when "1"
        menu(@message = "Enter the Wine You Would Like to Look Up", wine_desc=nil) 
        when "2"
        list_wineinfo(klass=WineInfo::Wine,wine_desc=nil)
        when "3"
      
        when "9"
          puts "Goodbye . . ."
          kp_proc = false
      else
        puts "Please make a valid selection"
      end #case
    end #do
  end #call
    
     
end
