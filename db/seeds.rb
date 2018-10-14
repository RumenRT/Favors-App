# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Favor.find_or_create_by(
  user_id: 2,
  description: 'Help me finding an old book in my attic',
  category: 2,
  street: "2231 Prairie Ave",
  city: "Miami Beach"
)
sleep 1
Favor.find_or_create_by(
  user_id: 2,
  description: 'Help me move this anvil in my garage please',
  category: 0,
  street: "1 Dali Blvd",
  city: "St Petersburg",
  state: "FL"
)
sleep 1
Favor.find_or_create_by(
  user_id: 2,
  description: 'looking for an algebra 1 book',
  category: 2,
  street: "11 Washington Ave",
  city: "Miami Beach"
)
sleep 1
Favor.find_or_create_by(
  user_id: 2,
  description: 'Help me clean my garage!',
  category: 3,
  street: "549 NW 28th Street",
  city: "Miami",
  state: "Florida"
)
sleep 1
Favor.find_or_create_by(
  user_id: 2,
  description: 'Help me install windows 10 on my pc please.',
  category: 4,
  street: "565 NW 24th St",
  city: "Miami",
  state: "Florida"
)
sleep 1
Favor.find_or_create_by(
  user_id: 2,
  description: 'anybody want to have dinner at my place tonight, its free!',
  category: 1,
  street: "2625 NW 10th Ave",
  city: "Miami",
  state: "Florida"
)
sleep 1
Favor.find_or_create_by(
  user_id: 2,
  description: 'I need help getting the gorceries out of my car',
  category: 0,
  street: "730 NW 36th St",
  city: "Miami",
  state: "Florida"
)
sleep 1
Favor.find_or_create_by(
  user_id: 2,
  description: 'I lost my dog, last I saw he was on this street',
  category: 2,
  street: "3001 NW 2nd Ave",
  city: "Miami",
  state: "Florida"
)
