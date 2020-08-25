class WineInfo::Vintage
  
  attr_accessor :wine_desc, :vintage, :price_avg, :price_min, :price_max, :ws_score
  
  @@all = []
  @@vintage = {}
  
  def initialize(wine_desc, vintage, price_avg, price_min, price_max, ws_score)
    binding.pry
    self.vintage ={"wine_desc" => @wine_desc,
                   "price_avg" => @price_avg,
                   "price_min" => @price_min,
                   "price_max" => @price_max,
                   "ws_score"  => @ws_score
                   }
    @@all << 
    binding.pry
    
  end
  
  
end