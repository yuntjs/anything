class RestaurantsController < ApplicationController

  def index

  end

  def find
    zipcode = params[:zipcode]
    redirect_to action: "show", zipcode: zipcode
  end

  def show
    zipcode = params[:zipcode]
    client = Yelp::Client.new({consumer_key: 'wkYn1Vpp85jFwM1jUFCuEg',consumer_secret: '9edatASynSP1-bqia3oRA-Fx_Z8',token: 'JuRtpF95wsG5sOskvsBPXPd3e-1bIx98',token_secret: 'L58HK1jRigqkAS55jKR1aV94EHM'})
    default = {limit: Restaurant.limit, category_filter: Category.all.sample.category}
    search = {radius_filter: miles_to_meter(10)}
    total = client.search(zipcode,default,search).total
    restaurants = client.search(zipcode,default,search).businesses

    if Restaurant.more_than_40?(restaurants)
      offset = Restaurant.choose_random_offset(restaurants,total)
      selected_restaurants = client.search(zipcode,default,search,{offset: offset}).businesses
      @selected_restaurant = selected_restaurants.sample
    else
      @selected_restaurant = restaurants.sample
    end

  end

end
