require "rails_helper"

RSpec.describe "items index page" do
  it "shows all items from the current store" do
    #store and items we will expect to see
    shoes = Store.create!(name: "Soren's Shoes")
    left_shoe = Item.create!(name: "Left shoe", price: 100, store_id: shoes.id)
    right_shoe = Item.create!(name: "Right shoe", price: 200, store_id: shoes.id)
    
    #store and items we will expect to NOT see
    castles = Store.create!(name: "Carl's Castles")
    cat_castle = Item.create!(name: "A castle for a cat", price: 300, store_id: castles.id)
    
    visit "/stores/#{shoes.id}/items"
    
    #we should see items from the current store
    expect(page).to have_content("Soren's Shoes")
    expect(page).to have_content("Left shoe")
    expect(page).to have_content("Right shoe")
    expect(page).to have_content("100")
    expect(page).to have_content("200")
    
    #we should NOT see items from another store
    expect(page).to_not have_content("A castle for a cat")
    expect(page).to_not have_content("300")
  end
  
  it "can create new items" do
    #store with only one item
    shoes = Store.create!(name: "Soren's Shoes")
    left_shoe = Item.create!(name: "Left shoe", price: 100, store_id: shoes.id)
    
    visit "/stores/#{shoes.id}/items"
    
    #we should see the single item and its price
    expect(page).to have_content("Left shoe")
    expect(page).to have_content("100")
    
    #we should NOT see the other item or its price
    expect(page).to_not have_content("Right shoe")
    expect(page).to_not have_content("200")
    
    #create new item
    click_link "Create Item"
    fill_in "Name", with: "Right shoe"
    fill_in "Price", with: "200"
    click_button "Submit"

    #check that we are back to the items index page after item creation
    expect(current_path).to eq("/stores/#{shoes.id}/items")
    
    #we should see both items and their prices
    expect(page).to have_content("Left shoe")
    expect(page).to have_content("100")
    expect(page).to have_content("Right shoe")
    expect(page).to have_content("200")
  end
end