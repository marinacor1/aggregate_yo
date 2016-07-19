locations =
[Place.create(name: 'Oahu', slug: "Oahu"),
Place.create(name: 'Austin', slug: "Austin"),
Place.create(name: 'San Antonio', slug: "San Antonio"),
Place.create(name: 'New York City', slug: "New York City"),
Place.create(name: 'Boston', slug: "Boston"),
Place.create(name: 'Denver', slug: "Denver"),
Place.create(name: 'Miami, FL', slug: "Miami"),
Place.create(name: 'New Orleans', slug: "New Orleans")]
locations.each do |loc|
  loc.save
end
