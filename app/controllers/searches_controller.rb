class SearchesController < ApplicationController

  def home
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = ENV['FOURSQUARE_API_ID']
      req.params['client_secret'] = ENV['FOURSQUARE_API_SECRET']
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash['response']['venues']
  end

  def hike
    @resp = Faraday.get "https://trailapi-trailapi.p.mashape.com/?limit=25&q[activities_activity_type_name_eq]=hiking&q[city_cont]=?&radius=25&q[state_cont]=?" do |req|
      req.headers['X-Mashape-Key'] = 'iqmUgMu5uxmshAf9FL5keI4EPSnpp1zQlVmjsnwdw5wchx92WG'
      req.headers['Accept'] = 'text/plain'
      req.params['q']['city_cont'] = params[:city]
      req.params['q']['state_cont'] = params[:state]
    end
    body = JSON.parse(@resp.body)
    @search = body['places']
  end


end ## class end
