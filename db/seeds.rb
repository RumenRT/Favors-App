keys = [
  :user_id,
  :description,
  :category,
  :street,
  :city,
  :completed,
]
values = 
[
[
  4,
  'Help me finding an old book in my attic',
  1,
  "2231 Prairie Ave",
  "Miami Beach",
  false
],
[
  2,
  'Help me move this anvil in my garage please',
  0,
  "1 Dali Blvd",
  "St Petersburg",
  "FL",
  false
],
[
  4,
  'looking for an algebra 1 book',
  1,
  "252 NW 29th St",
  "Miami",
  false
],
[
  2,
  'Help me clean my garage!',
  4,
  "549 NW 28th Street",
  "Miami",
  "Florida",
  false
],
[
  2,
  'Help me install windows 10 on my pc please.',
  3,
  "565 NW 24th St",
  "Miami",
  "Florida",
  false
],
[
  3,
  'anybody want to have dinner at my place tonight, its free!',
  2,
  "2625 NW 10th Ave",
  "Miami",
  "Florida",
  false
],
[
  3,
  'I need help getting the gorceries out of my car',
  0,
  "730 NW 36th St",
  "Miami",
  "Florida",
  false,
],
[
  4,
  'I lost my dog, last I saw he was on this street',
  1,
  "3001 NW 2nd Ave",
  "Miami",
  "Florida",
  false,
],
]

values.each do |values|
Favor.find_or_create_by(Hash[keys.zip(values)])
end
