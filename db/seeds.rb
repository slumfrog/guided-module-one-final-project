

10.times do 
    Artist.create(name: Faker::Music::RockBand.name, genre: Faker::Music.genre)
end
puts "Artists seeded"


10.times do
    Fan.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , username: Faker::Internet.username, password: Faker::Internet.password)
end
puts "Fans seeded"


30.times do
    fan = Fan.all.sample
    artist = Artist.all.sample
    Gig.create(fan: fan, artist: artist, name: Faker::Music.band, city: Faker::Address.city)
end
puts "Gigs seeded"
