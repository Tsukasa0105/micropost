class RestaurantsController < ApplicationController
  def new
  end 
  
  def search 
  url = https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=,{6535da406d2e7e47ee9ee620ca91f061}
  if params[:search]
    word=params[:search]
    url << "&name=" << word
  end
  url = URI.encode(url)
  uri = URI.parse(url)
  json = NET::HTTP.get(uri)
  result = JSON.parse(json)
    @rests = result["rest"] 
end 
  
end
