#require 'pry'
class WineInfo::CLI

  attr_accessor :message
  
  def initialize(message="Enter the Wine You Would Like to Look Up")
    @message = message
    menu(message)
  end
  
  def call 
    puts "Welcome to Wine Info!!"
    menu(message)
  end
  
  def menu(message)
    puts message
    input = gets.chomp
    #binding.pry
    WineInfo::API.get_info(input)
  end
  
end
