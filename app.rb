require 'sinatra'
require 'sinatra/reloader'
require './lib/parcels'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get "/shipping_cost" do
  height = params.fetch("height").to_i
  width = params.fetch("width").to_i
  depth = params.fetch("depth").to_i
  weight = params.fetch("weight").to_i

  parcel = Parcels.new(height, width, depth, weight)
  
  @message = "It will cost $#{parcel.cost_to_ship} to ship your parcel!"
  erb(:output)
end
