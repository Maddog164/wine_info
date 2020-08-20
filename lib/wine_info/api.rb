class WineInfo::API 
  
  def self.get_categories
    cats = RestClient.get('https://api.wine-searcher.com/x?api_key=test6ws20200819ur&winename=petrus&vintage=2011')
    @cats = JSON.parse(cats)
    binding.pry 
  end
  
  
end