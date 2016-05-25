12.times do
  User.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    bio: Faker::Lorem.paragraph,
    picture: Faker::Avatar.image,
    role: "judge")
end

20.times do
  User.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    bio: Faker::Lorem.paragraph,
    picture: Faker::Avatar.image)
end

genres = ["Comedy", "Drama", "Thriller/Horror", "Romance", "Short", "Documentary"]

i = 0

while i < genres.length
  Genre.create!(title: genres[i], picture: Faker::Avatar.image)
  i += 1
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: Faker::Avatar.image,
    genre_id: 1)
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: Faker::Avatar.image,
    genre_id: 2)
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: Faker::Avatar.image,
    genre_id: 3)
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: Faker::Avatar.image,
    genre_id: 4)
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: Faker::Avatar.image,
    genre_id: 5)
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: Faker::Avatar.image,
    genre_id: 6)
end

10.times do
  Rating.create!(stars: rand(1..5),
    review: Faker::Lorem.paragraph,
    user_id: rand(1..20),
    film_id: rand(1..10))
end

10.times do
  Rating.create!(stars: rand(1..5),
    review: Faker::Lorem.paragraph,
    user_id: rand(1..20),
    film_id: rand(10..20))
end

10.times do
  Rating.create!(stars: rand(1..5),
    review: Faker::Lorem.paragraph,
    user_id: rand(1..20),
    film_id: rand(20..30))
end

10.times do
  Rating.create!(stars: rand(1..5),
    review: Faker::Lorem.paragraph,
    user_id: rand(1..20),
    film_id: rand(30..40))
end

10.times do
  Rating.create!(stars: rand(1..5),
    review: Faker::Lorem.paragraph,
    user_id: rand(1..20),
    film_id: rand(40..50))
end

10.times do
  Rating.create!(stars: rand(1..5),
    review: Faker::Lorem.paragraph,
    user_id: rand(1..20),
    film_id: rand(50..60))
end

20.times do
  Comment.create!(body: Faker::Lorem.paragraph,
    user_id: rand(1..20),
    rating_id: (1..60))
end





