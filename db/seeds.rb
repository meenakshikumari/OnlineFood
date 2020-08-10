# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## ADD Restaurant ##

restaurant1 = Restaurant.find_or_initialize_by(
    name: 'KFC',
    phone: '1234567890',
    cost_for_two: 400,
    tags: ["Quick Bites"],
    cuisines: ["Burger", "Fast Food", "Finger Food", "Beverages"])

restaurant1.open_time = (Time.zone.parse "10 AM").strftime("%H:%M")
restaurant1.close_time = (Time.zone.parse "10 PM").strftime("%H:%M")

restaurant1.build_address(house_no: "67", locality: "Deccan Gymkhana", pincode: 411004, city: "Pune", state: "Maharashtra")

## ADD MENU ITEMS ##

def add_menues(restaurant,menu_items)
  menu_items.each do |m|
    restaurant.menu_items.find_or_initialize_by(m)
  end
end

menu = [{name:"veg roll",price:40,veg:true,available: true, description: "veg roll"},
  {name:"cheese pizza",price:90,veg:true,available: true, description: "cheesy pizza"},
  {name:"chicken roll",price:60,veg:false,available: true, description: "cheesy chicken roll"},
  {name:"manchurian",price:80,veg:false,available: true, description: "cheesy chicken manchurian"},
  {name:"biryani",price:100,veg:false,available: true, description: "chicken biryani"},
  {name:"veg kolhapuri",price:130,veg:true,available: true, description: "veg kolhapuri"},
  {name:"paneer tikka",price:110,veg:true,available: true, description: "paneer tikka"},
  {name:"spicy paneer tikka",price:110,veg:true,available: true, description: "spicy paneer tikka"},
  {name:"veg maratha",price:120,veg:true,available: true, description: "spicy veg maratha"}]

add_menues(restaurant1, menu)
restaurant1.save!

restaurant2 = Restaurant.find_or_initialize_by(
    name: 'Barbeque Ville',
    phone: '1214567890',
    rating: 4.5,
    open_time: (Time.zone.parse "10 AM").strftime("%H:%M"),
    close_time: (Time.zone.parse "10 PM").strftime("%H:%M"),
    cost_for_two: 1000,
    tags: ["Casual Dining"],
    cuisines: ["North Indian", "BBQ"])

restaurant2.build_address(house_no: "2", locality: "Wakad", pincode: 411015, city: "Pune", state: "Maharashtra")
add_menues(restaurant2, menu)
restaurant2.save!

## ADD USERS ##

user1 = User.find_or_initialize_by(name: 'Test User 1', mobile_number: "+918830229950", email: "test@test.com",
  role: "end_user", is_active: true)
user1.password = "test123"
user1.build_address(house_no: "67", locality: "kharadi", pincode: 416417, city: "Banglore", state: "karnataka")
user1.save!

user2 = User.find_or_initialize_by(name: 'Test User 2', mobile_number: "+918220229950", email: "test2@test.com",
  role: "end_user", is_active: true)
user2.password = "test0123"
user2.build_address(house_no: "70", locality: "Civil Lines", pincode: 234417, city: "Amritsar", state: "Punjab")
user2.save!

## ADD ORDERS AND ORDER DETAILS ##

order1 = Order.find_or_initialize_by(status: "Confirmed", payment_mode: "Cash", total_cost: 900)
order1.restaurant_id = restaurant1.id
order1.user_id = user1.id
menu_item = order1.restaurant.menu_items.first
order1.order_details.build(menu_item_id: menu_item.id, status: "Confirmed", quantity: 2, cost: menu_item.price * 2,
 menu_item_name: menu_item.name)
order1.save!

order2 = Order.find_or_initialize_by(status: "Confirmed", payment_mode: "Card", total_cost: 1900)
order1.restaurant_id = restaurant1.id
order1.user_id = user1.id
menu_item = order1.restaurant.menu_items.first
order1.order_details.build(menu_item_id: menu_item.id, status: "Confirmed", quantity: 2, cost: menu_item.price * 2,
 menu_item_name: menu_item.name)
order1.save!

## ADD REVIEWS ##

review1 = user1.reviews.build(rating: 4.5, comment: "Nice food!")
review1.restaurant_id = restaurant1.id
review1.save!

Review.create(rating: 3, comment: "Ok", restaurant_id: restaurant1.id, user_id: user2.id)
Review.create(rating: 3, comment: "Ok", restaurant_id: restaurant2.id, user_id: user2.id)
