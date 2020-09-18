# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

flat = Flat.new( name: "Le Wagon Madrid 😍")
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

bill_2 = Bill.new(name: "Electricity", flat_id: flat.id, user_id: user_2.id, paying_user_id: user_2.id, due_date: Date.today - 10, amount: 220, category: "electricity" )
bill_2.save!

bill_3 = Bill.new(name: "Gas", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today + 10, amount: 300, category: "gas" )
bill_3.save!

bill_4 = Bill.new(name: "Internet", flat_id: flat.id, user_id: user_4.id, paying_user_id: user_4.id, due_date: Date.today + 2, amount: 100, category: "internet" )
bill_4.save!

bill_5 = Bill.new(name: "Water", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today - 15, amount: 250, category: "water" )
bill_5.save!

bill_6 = Bill.new(name: "Rent", flat_id: flat.id, user_id: user_2.id, paying_user_id: user_2.id, due_date: Date.today - 25, amount: 1200, category: "rent" )
bill_6.save!

bill_7 = Bill.new(name: "Water", flat_id: flat.id, user_id: user_3.id, paying_user_id: user_3.id, due_date: Date.today - 30, amount: 250, category: "water" )
bill_7.save!


puts "Create areas"





