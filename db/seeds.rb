# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#


NUMBER_OF_ARTISTS = 10
NUMBER_OF_POSTS = 20
NUMBER_OF_PROJECTS = 20
NUMBER_OF_FANS = 20

# create the given number of artists
NUMBER_OF_ARTISTS.times { Artist.create(name: Faker::Name.name) }

# create the given number of fans
NUMBER_OF_FANS.times { Fan.create(name: Faker::Name.name) }

# create a profile for each artist
NUMBER_OF_ARTISTS.times do |index |
  ArtistProfile.create( artist_id: index + 1, 
                       name: Artist.find(index + 1).name,
                        bio: Faker::Lorem.paragraph,
                        city: Faker::Nation.capital_city,
                        image_url: Faker::Avatar.image
                       ) 
end


# create the given number of posts and projects for each artist
Artist.all.each do |artist|
  NUMBER_OF_POSTS.times do |index|
    artist.posts.create(
      caption: Faker::Lorem.sentence,
      image_url: Faker::Avatar.image,
      like: rand(20) 
    )
  end


  NUMBER_OF_PROJECTS.times do 
    artist.projects.create(
      title: Faker::Lorem.sentence,
      video_url: Faker::Avatar.image,
      support: rand(201),
      supports: 0,
      likes: 0,
      plays: 0
    )
  end
end

# create an account for each fan
Fan.all.each do |fan|
  FanAccount.create(
    fan_id: fan.id,
    balance: rand(1000)
  )
end
