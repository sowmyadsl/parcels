require "parcels"
require "rspec"
require "pry"


describe 'Parcels#newparcel' do
  newparcel = Parcels.new(12,50,10,25)

  it "returns a new parcel with dimensions and weight" do
    expect(newparcel.volume).to eq 6000
  end

end

describe 'Parcels#cost_to_ship' do

  it "returns 10 for a parcel with less than 500 volume" do
    newparcel = Parcels.new(5,5,5,20)
    expect(newparcel.cost_to_ship).to eq 10
  end

  it "returns 50 for a very large parcel" do
    newparcel = Parcels.new(50,50,50,20)
    expect(newparcel.cost_to_ship).to eq 50
  end

end

describe 'Parcels#add_parcel' do

  it "add parcel to the parcels array" do
    newparcel = Parcels.new(50,50,50,20)
    newparcel.add_parcel
    expect(Parcels.all).to eq [newparcel]
  end
end
