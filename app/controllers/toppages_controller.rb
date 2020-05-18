class ToppagesController < ApplicationController
  def index

    if logged_in?
      require "net/http"
      url = 'https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=6535da406d2e7e47ee9ee620ca91f061'
      if params[:search]
        url = url + "&freeword=" + params[:search]
        url = URI.encode(url) 
        uri = URI.parse(url)
        json = Net::HTTP.get(uri)
        result = JSON.parse(json)
        @rests = result["rest"]
      else
        @rests = []
      end
      @micropost = current_user.microposts.build  # form_with 用
      @microposts = current_user.feed_microposts.order(id: :desc).page(params[:page])
    end
  end
end
