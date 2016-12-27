class RestaurantsController < ApplicationController

  def find
    Restaurant.open_now
    client = Yelp::Client.new({consumer_key: 'wkYn1Vpp85jFwM1jUFCuEg',consumer_secret: '9edatASynSP1-bqia3oRA-Fx_Z8',token: 'JuRtpF95wsG5sOskvsBPXPd3e-1bIx98',token_secret: 'L58HK1jRigqkAS55jKR1aV94EHM'})
    default = {limit: Restaurant.limit, open_now: Restaurant.open_now, category_filter: Category.all.sample.category}
    search = {radius_filter: miles_to_meter(10), offset: 0, price: 1}
    total = client.search('22312',default,search).total
    restaurants = client.search('22312',default,search).businesses

    loop do
      if Restaurant.more_than_40?(restaurants)
        offset = Restaurant.choose_random_offset(restaurants,total)
        selected_restaurants = client.search('22312',default,search,{offset: offset}).businesses
        @selected_restaurant = selected_restaurants.sample
      else
        @selected_restaurant = restaurants.sample
      end
      break if Restaurant.been_to?(current_user,@selected_restaurant.name)
    end

  end

end
