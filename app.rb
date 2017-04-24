require 'sinatra'
require 'sinatra/reloader'
require './lib/parcels'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

post "/shipping_cost" do
  height = params.fetch("height").to_i
  width = params.fetch("width").to_i
  depth = params.fetch("depth").to_i
  weight = params.fetch("weight").to_i

  parcel = Parcels.new(height, width, depth, weight)
  parcel.add_parcel

  @gift_wrap = if params["gift-wrap"] == 'on'
    true
  else
    false
  end

  @parcels = Parcels.all
  @message = if @gift_wrap == false
    "It will cost $#{parcel.cost_to_ship} to ship your parcel!"
  else
    "It will cost $#{parcel.cost_to_ship} to ship your parcel and $#{parcel.gift_wrap_price} to wrap!"
  end
  erb(:output)
end

get "/clear" do
  Parcels.clear
  @parcels = Parcels.all
  @message = "you cleared your cart!"
  erb(:output)
end
