12.times do
  User.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    bio: Faker::Lorem.paragraph,
    picture: "http://qadishtuwalking.com/files/huge.24.124304.jpg",
    role: "judge")
end

20.times do
  User.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password",
    bio: Faker::Lorem.paragraph,
    picture: "https://keetonsonline.files.wordpress.com/2015/05/0753.png")
end

genres = ["Comedy", "Drama", "Thriller/Horror", "Romance", "Short", "Documentary"]

genre_pictures = ["http://trustmywatch.weebly.com/uploads/4/1/1/4/41147171/1751854_orig.jpg", "http://www.synchme.com/store/filesnegozio/images/Banner_Drama.jpg", "http://stagebrief.co.ug/Images/Actor%20101/2014/HORROR2.jpg", "http://tag-fox.com/upload/2013/12/14/20131214115427-26ae5897.jpg", "http://www.filmfestivals.com/files/images/u22164/Short%20Films-2.jpg", "https://tonyfolden.files.wordpress.com/2015/09/documentary-shot.jpg"]

i = 0

while i < genres.length
  Genre.create!(title: genres[i], picture: genre_pictures[i])
  i += 1
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: "http://images.clipartpanda.com/intake-clipart-movie-clapper.svg",
    genre_id: 1)
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: "http://images.clipartpanda.com/intake-clipart-movie-clapper.svg",
    genre_id: 2)
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: "http://images.clipartpanda.com/intake-clipart-movie-clapper.svg",
    genre_id: 3)
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: "http://images.clipartpanda.com/intake-clipart-movie-clapper.svg",
    genre_id: 4)
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: "http://images.clipartpanda.com/intake-clipart-movie-clapper.svg",
    genre_id: 5)
end

10.times do
  Film.create!(title: Faker::Book.title,
    director: Faker::Name.name,
    description: Faker::Lorem.paragraph,
    picture: "http://images.clipartpanda.com/intake-clipart-movie-clapper.svg",
    genre_id: 6)
end

50.times do
  rating = Rating.create!(stars: rand(1..5),
    review: Faker::Lorem.paragraph,
    user: User.all.sample,
    film: Film.all.sample)
  rating.comments.create!(user: User.all.sample, body: Faker::Lorem.paragraph)
end

User.create!(first_name: "Bobby",
    last_name: "Je Niro",
    email: "samblackman@devbootcamp.com",
    password: "password",
    bio: "Alias: Sam Blackman",
    picture: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAWcAAAAJDdkNmMzNjYwLTYxYmQtNDdlMi05MWM0LTUwZjdmMWQwMmE1Ng.jpg",
    role: "admin")

User.create!(first_name: "Peo",
    last_name: "Picaprio",
    email: "pan@devbootcamp.com",
    password: "password",
    bio: "Alias: Pan Wangperawong",
    picture: "https://pbs.twimg.com/media/A8RBzPrCcAAFfFy.jpg",
    role: "admin")







