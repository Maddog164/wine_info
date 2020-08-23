class WineInfo::Wine 
  
  attr_accessor :region, :grape, :prive_avg, :price_min, :price_max, :ws_score
  
  @@all = []
  
  def initialize(response_hash)
    @region = response_hash["wine-details"][0]["region"]
    @grape = response_hash["wine-details"][0]["grape"]
    @price_avg = response_hash["wine-details"][0]["price-avg"]
    @price_min = response_hash["wine-details"][0]["price-min"]
    @price_max = response_hash["wine-details"][0]["price-max"]
    @ws_score = response_hash["wine-details"][0]["ws_score"]
    
  end
  
  
end