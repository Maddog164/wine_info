class WineInfo::Wine 
  
  attr_accessor :wine_desc, :vintage, :region, :grape, :prive_avg, :price_min, :price_max, :ws_score
  
  @@all = []
  @@wine_hash = {}
  
  def initialize(wine_desc, vintage, response_hash)
    #binding.pry
    @region = response_hash["wine-details"][0]["region"]
    @grape = response_hash["wine-details"][0]["grape"]
    @price_avg = response_hash["wine-details"][0]["price-average"]
    @price_min = response_hash["wine-details"][0]["price-min"]
    @price_max = response_hash["wine-details"][0]["price-max"]
    @ws_score = response_hash["wine-details"][0]["ws-score"]
    @@wine_hash = {"wine_desc" => wine_desc,
                   "vintage" => vintage,
                   "region" => @region,
                   "grape" => @grape,
                   "price_avg" => @price_avg,
                   "price_min" => @price_min,
                   "price_max" => @price_max,
                   "ws_score"  => @ws_score
                   }
    @@all << @@wine_hash
    #binding.pry
  end
  
  def self.all
    @@all
  end
  
  def self.del_wine(wine_desc)
    @@all2 = []
    puts "deleting wine"
    i=0
    #binding.pry
    while i < self.all.length do
      if self.all[i]["wine_desc"] != wine_desc
        @@all2 << self.all[i]
      end
      i += 1 
    end #do
    #binding.pry
    @@all = @@all2
    
    #   if self.all[i]["wine_desc"]== wine_desc
    #     self.all[i].clear 
    #     binding.pry
    #   end
    # i+=1 
 end
  
  # def print_deets_of_search
  #   puts @@wine_hash
  # end
  
 end