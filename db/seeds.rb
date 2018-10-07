# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Favor.find_or_create_by(
  user_id: 2,
  description: 'something done',
  category: Random.rand(3),
  street: "2231 Prairie Ave",
  city: "Miami Beach"
)
sleep 1
Favor.find_or_create_by(
  user_id: 2,
  description: 'something done',
  category: Random.rand(3),
  street: "1 Dali Blvd",
  city: "St Petersburg",
  state: "FL"
)
sleep 1
Favor.find_or_create_by(
  user_id: 2,
  description: 'something done',
  category: Random.rand(3),
  street: "11 Washington Ave",
  city: "Miami Beach"
)
sleep 1
Favor.find_or_create_by(
  user_id: 2,
  description: 'something done',
  category: Random.rand(3),
  street: "549 NW 28th Street",
  city: "Miami",
  state: "Florida"
)