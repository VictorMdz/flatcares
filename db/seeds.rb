puts "Deleting all users and flats"

User.destroy_all
Flat.destroy_all
Flatmember.destroy_all

puts "Creating users"


user_1 = User.new( first_name: "Victor", last_name: "Mendoza", email: "mendoza@gmail.com", password: "1234567" )
user_1.save!

user_2 = User.new( first_name: "Jesús", last_name: "Antay",  email: "antay@gmail.com", password: "1234567" )
user_2.save!


user_3 = User.new( first_name: "Camille", last_name: "Supery",  email: "supery@gmail.com", password: "1234567" )
user_3.save!

user_4 = User.new( first_name: "Mara", last_name: "Chimeno",  email: "chimeno@gmail.com", password: "1234567" )
user_4.save!



puts "Creating a flat"

flat = Flat.new( name: "Le Wagon Madrid 😍", full_address: "Calle Pío Baroja 23 1F, 26773")
flat.save!


puts "Creating Flat Members"

flatmember_1 = Flatmember.new(flat_id: flat.id, user_id: user_1.id )
flatmember_1.save!

flatmember_2 = Flatmember.new(flat_id: flat.id, user_id: user_2.id )
flatmember_2.save!

flatmember_3 = Flatmember.new(flat_id: flat.id, user_id: user_3.id )
flatmember_3.save!

flatmember_4 = Flatmember.new(flat_id: flat.id, user_id: user_4.id )
flatmember_4.save!

puts "Creating bills"

bill_1 = Bill.new(name: "Rent", flat_id: flat.id, user_id: user_1.id, paying_user_id: user_1.id, due_date: Date.today + 10, amount: 1200, category: "rent" )
bill_1.save!

bill_2 = Bill.new(name: "Electricity", flat_id: flat.id, user_id: user_2.id, paying_user_id: user_2.id, due_date: Date.today + 8, amount: 220, category: "electricity" )
bill_2.save!

bill_3 = Bill.new(name: "Gas", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today + 8, amount: 300, category: "gas" )
bill_3.save!

bill_4 = Bill.new(name: "Internet", flat_id: flat.id, user_id: user_4.id, paying_user_id: user_4.id, due_date: Date.today + 5 , amount: 100, category: "internet" )
bill_4.save!

bill_5 = Bill.new(name: "Water", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today + 2, amount: 250, category: "water" )
bill_5.save!

bill_6 = Bill.new(name: "Rent", flat_id: flat.id, user_id: user_2.id, paying_user_id: user_2.id, due_date: Date.today - 10, amount: 1200, category: "rent" )
bill_6.save!

bill_7 = Bill.new(name: "Water", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today - 13, amount: 250, category: "water" )
bill_7.save!

bill_8 = Bill.new(name: "Other", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today + 15, amount: 100, category: "other" )
bill_8.save!


puts "Create areas"

area_1 = Area.new(name: "Kitchen", flat_id: flat.id, assigned_user_id: user_3.id, previously_assigned_user_id: user_2.id )
area_1.save!

area_2 = Area.new(name: "Toilet", flat_id: flat.id, assigned_user_id: user_4.id, previously_assigned_user_id: user_2.id )
area_2.save!

area_3 = Area.new(name: "Living Room", flat_id: flat.id, assigned_user_id: user_3.id, previously_assigned_user_id: user_3.id )
area_3.save!

area_4 = Area.new(name: "Garden", flat_id: flat.id, assigned_user_id: user_4.id, previously_assigned_user_id: user_1.id )
area_4.save!

area_5 = Area.new(name: "Stairs", flat_id: flat.id, description: "Be carefull with the dog", assigned_user_id: user_2.id, previously_assigned_user_id: user_3.id )
area_5.save!

area_6 = Area.new(name: "Bathroom", flat_id: flat.id, description: "Try to clean in the morning!", assigned_user_id: user_1.id, previously_assigned_user_id: user_2.id )
area_6.save!








