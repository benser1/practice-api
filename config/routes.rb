Rails.application.routes.draw do

    root "searches#home"

    get '/foursquare', to: 'searches#foursquare'
    post '/foursquare', to: 'searches#foursquare'

    get '/hike', to: 'searches#hike'
    post '/hike', to: 'searches#hike'


end
