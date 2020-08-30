#require 'pry'
class WineInfo::CLI

  attr_accessor :message, :wine_desc
  
    def wait_for_response(resp_message)
      puts "#{resp_message}"
      puts "PRESS ANY KEY TO RETURN TO MENU"
      wine_details_enter = gets.chomp
      system("clear")
    end
      
  
    def list_wineinfo(klass,message,wine_desc)
      i = 0 
      #binding.pry
      puts "#{message}"
      hold_wine_desc = ""
      klass.all.each do |inside_desc|
      #binding.pry
      if (wine_desc != nil && wine_desc == klass.all[i]["wine_desc"]) || wine_desc == nil
        #|| wine_desc == klass.all[i]["wine_desc"]
        if hold_wine_desc != klass.all[i]["wine_desc"]
          puts ("Wine Description #{klass.all[i]["wine_desc"].split.map(&:capitalize).join(" ")}")
          hold_wine_desc = klass.all[i]["wine_desc"]
        end #if
        puts ("   #{klass.all[i]["vintage"]}  Average Price  #{klass.all[i]["price_avg"]}   Score: #{klass.all[i]["ws_score"]}")
        #puts "#{klass.all[i]["wine_desc"]}"
      end #if
        i += 1
    end #do
    wait_for_response(resp_message = "")
    end 
    
  def list_wine_for_delete
      temp_array = []
      i = 0 #iterate through entire hash
      t = 0 #iterate through each wine (wine_desc)
      system("clear")
      puts "A List of Wines in Your Search Library:"
      hold_wine_desc = ""
      klass = WineInfo::Wine
      klass.all.each do |inside_desc|
        if hold_wine_desc != klass.all[i]["wine_desc"]
         puts ("#{(t+1).to_s}"+ ": #{klass.all[i]["wine_desc"].split.map(&:capitalize).join(" ")}")
         hold_wine_desc = klass.all[i]["wine_desc"]
         temp_array << "wine_desc"
         t += 1
        end #if
        i += 1
    end #do
    puts "Enter the number that corresponds with the wine you would like to delete"
    del_input = gets.chomp.to_i 
    if del_input.between?(1,t)
      WineInfo::Wine.del_wine(temp_array[del_input-1])
    else
      wait_for_response(resp_message = "Not a Valid Entry") 
    end #if
      #delete method in WineInfo::Wine
  end 
     
    
  def menu(message, wine_desc)
    if message == "Here are the results of your search:"
      list_wineinfo(klass=WineInfo::Wine,message,wine_desc)
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
      system("clear")
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
          if WineInfo::Wine.all.length > 0
            list_wineinfo(klass=WineInfo::Wine,message="Your search results for this session",wine_desc=nil)
          else
            wait_for_response (resp_message= "You don't have any Search data yet!!")
          end #if
        when "3"
          list_wine_for_delete
      
        when "9"
          puts "Goodbye . . ."
          kp_proc = false
      else
        wait_for_response(resp_message = "Please make a valid selection")
      end #case
    end #do
  end #call
    
     
end
