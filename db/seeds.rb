puts "Deleting all users and flats"
Participation.destroy_all
Event.destroy_all
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

flat = Flat.new( name: "The Suspects 🕵", full_address: "Calle Pío Baroja 23 1F, 26773")
flat.save!


puts "Creating Flat Members"

flatmember_1 = Flatmember.new(flat_id: flat.id, user_id: user_1.id, is_admin: true )
flatmember_1.save!

flatmember_2 = Flatmember.new(flat_id: flat.id, user_id: user_2.id )
flatmember_2.save!

flatmember_3 = Flatmember.new(flat_id: flat.id, user_id: user_3.id )
flatmember_3.save!

flatmember_4 = Flatmember.new(flat_id: flat.id, user_id: user_4.id )
flatmember_4.save!

puts "Creating bills"

bill_1 = Bill.new(name: "Rent", flat_id: flat.id, user_id: user_1.id, paying_user_id: user_1.id, due_date: Date.today + 5, amount: 1200, category: "rent" )
bill_1.save!

bill_2 = Bill.new(name: "Electricity", flat_id: flat.id, user_id: user_2.id, paying_user_id: user_2.id, due_date: Date.today + 8, amount: 220, category: "electricity" )
bill_2.save!

bill_3 = Bill.new(name: "Gas", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today + 8, amount: 300, category: "gas" )
bill_3.save!

bill_4 = Bill.new(name: "Internet", flat_id: flat.id, user_id: user_4.id, paying_user_id: user_4.id, due_date: Date.today + 5 , amount: 60, category: "internet" )
bill_4.save!

bill_5 = Bill.new(name: "Water", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today + 5, amount: 250, category: "water" )
bill_5.save!

bill_6 = Bill.new(name: "Rent", flat_id: flat.id, user_id: user_2.id, paying_user_id: user_2.id, due_date: Date.today - 10, amount: 1200, category: "rent" )
bill_6.save!

bill_7 = Bill.new(name: "Water", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today - 4, amount: 250, category: "water" )
bill_7.save!

bill_8 = Bill.new(name: "Rent", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today - 15, amount: 1200, category: "rent" )
bill_8.save!

bill_9 = Bill.new(name: "Rent", flat_id: flat.id, user_id: user_2.id, paying_user_id: user_2.id, due_date: Date.today - 25, amount: 1200, category: "rent" )
bill_9.save!

bill_10 = Bill.new(name: "Rent", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today - 50, amount: 1200, category: "rent" )
bill_10.save!

bill_11 = Bill.new(name: "Rent", flat_id: flat.id, user_id: user_4.id, paying_user_id: user_4.id, due_date: Date.today - 75, amount: 1200, category: "rent" )
bill_11.save!

bill_12 = Bill.new(name: "Water", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today - 13, amount: 230, category: "water" )
bill_12.save!

bill_13 = Bill.new(name: "Water", flat_id: flat.id, user_id: user_4.id, paying_user_id: user_4.id, due_date: Date.today - 33, amount: 225, category: "water" )
bill_13.save!

bill_14 = Bill.new(name: "Water", flat_id: flat.id, user_id: user_1.id, paying_user_id: user_1.id, due_date: Date.today - 53, amount: 180, category: "water" )
bill_14.save!

bill_15 = Bill.new(name: "Internet", flat_id: flat.id, user_id: user_1.id, paying_user_id: user_1.id, due_date: Date.today - 25 , amount: 60, category: "internet" )
bill_15.save!

bill_16 = Bill.new(name: "Internet", flat_id: flat.id, user_id: user_2.id, paying_user_id: user_2.id, due_date: Date.today - 45 , amount: 60, category: "internet" )
bill_16.save!

bill_17 = Bill.new(name: "Internet", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today - 65 , amount: 60, category: "internet" )
bill_17.save!

bill_18 = Bill.new(name: "Internet", flat_id: flat.id, user_id: user_4.id, paying_user_id: user_4.id, due_date: Date.today - 85 , amount: 60, category: "internet" )
bill_18.save!





puts "Create areas"

area_1 = Area.new(name: "Kitchen", flat_id: flat.id, assigned_user_id: user_3.id, previously_assigned_user_id: user_2.id, category: "kitchen" )
area_1.save!

area_2 = Area.new(name: "Toilet", flat_id: flat.id, assigned_user_id: user_4.id, previously_assigned_user_id: user_2.id, category: "toilet"  )
area_2.save!

area_3 = Area.new(name: "Living Room", flat_id: flat.id, assigned_user_id: user_4.id, previously_assigned_user_id: user_2.id, category: "lounge" )
area_3.save!

area_4 = Area.new(name: "Garden", flat_id: flat.id, assigned_user_id: user_4.id, previously_assigned_user_id: user_1.id, category: "garden" )
area_4.save!

area_5 = Area.new(name: "Stairs", flat_id: flat.id, assigned_user_id: user_2.id, previously_assigned_user_id: user_3.id, category: "stairs"  )
area_5.save!

area_6 = Area.new(name: "Bathroom", flat_id: flat.id, assigned_user_id: user_1.id, previously_assigned_user_id: user_2.id, category: "bathroom" )
area_6.save!


puts "Create events"


event_1 = Event.create(name: "Mara's birthday", date: Date.today + 5, location: "Teatro Barceló", user_id: user_3.id, event_type: "party", flat_id: flat.id, start_time: Time.now + 6*60*60, end_time: Time.now + 12*60*60 )
event_1.save!

event_2 = Event.create(name: "Dinner with Victor's friends", date: Date.today - 6, location: "House", user_id: user_1.id, event_type: "dinner", flat_id: flat.id, start_time: Time.now + 8*60*60, end_time: Time.now + 10*60*60 )
event_2.save!

event_3 = Event.create(name: "Plumber", date: Date.today + 4, location: "House", user_id: user_4.id, event_type: "repair", flat_id: flat.id, start_time: Time.now + 3*60*60, end_time: Time.now + 4*60*60 )
event_3.save!

event_4 = Event.create(name: "Flight to Egypt", date: Date.today + 4, location: "Airport", user_id: user_3.id, event_type: "holiday", flat_id: flat.id, start_time: Time.now + 10*60*60, end_time: Time.now + 10*60*60 )
event_4.save!

event_5 = Event.create(name: "Electrician", date: Date.today - 10, location: "House", user_id: user_2.id, event_type: "repair", flat_id: flat.id, start_time: Time.now + 1*60*60, end_time: Time.now + 1*60*60 )
event_5.save!

event_6 = Event.create(name: "Buy tickets for Justin Bieber Concert", date: Date.today + 2, location: "Sol, Madrid", user_id: user_4.id, event_type: "other", flat_id: flat.id, start_time: Time.now + 11*60*60, end_time: Time.now + 12*60*60 )
event_6.save!

event_7 = Event.create(name: "Dinner in 'La Tesqueria'", date: Date.today - 12, location: "Calle Duque de Sesto, 17", user_id: user_1.id, event_type: "dinner", flat_id: flat.id, start_time: Time.now + 11*60*60, end_time: Time.now + 12*60*60 )
event_7.save!

event_8 = Event.create(name: "Going for Tacos!!", date: Date.today - 18, location: "Plza Mayor", user_id: user_3.id, event_type: "dinner", flat_id: flat.id, start_time: Time.now + 10*60*60, end_time: Time.now + 10*60*60 )
event_8.save!



