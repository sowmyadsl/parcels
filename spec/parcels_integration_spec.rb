require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe("the shipping cost path", {:type => :feature}) do
  it("processes the user input and returns shipping cost of each item") do
    visit("/")
    fill_in("width", :with => 5)
    fill_in("height", :with => 5)
    fill_in("depth", :with => 5)
    fill_in("weight", :with => 20)
    click_button("cost")
    expect(page).to have_content("It will cost $10 to ship your parcel!")
  end
end
