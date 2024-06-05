  # This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"

puts 'destroy data'
ArtistAd.destroy_all
StageAd.destroy_all
Booking.destroy_all
Artist.destroy_all
Stage.destroy_all
Message.destroy_all
Conversation.destroy_all
User.destroy_all

# seed user
puts "create user"
john = User.create!(email: "john@example.com", password: "secret" )
eric = User.create!(email: "eric@example.com", password: "secret" )
sarah = User.create!(email: "sarah@example.com", password: "secret" )
marc = User.create!(email: "marc@example.com", password: "secret" )
nina = User.create!(email: "nina@example.com", password: "secret" )
tony = User.create!(email: "tony@example.com", password: "secret" )
erika = User.create!(email: "erika@example.com", password: "secret" )
tom = User.create!(email: "tom@example.com", password: "secret" )
isa = User.create!(email: "misaarc@example.com", password: "secret" )
kelly = User.create!(email: "kelly@example.com", password: "secret" )
puts "created #{User.count} users"

photo_artist = "https://www.loire.fr/upload/docs/image/jpeg/2022-04/th-940x1000-dub-inc.jpg.jpg.associated/th-1920x1000-th-940x1000-dub-inc.jpg.jpg.jpg"
# seed artist
puts "create artist"
artist_john = Artist.new({ user: john, bio: "Bio of Artist 1", name: "Artist 1", address: "rue de la république, rennes", phone_number: "123-456-7890"})
artist_john.photos.attach(io: URI.open(photo_artist), filename: "dubinc.jpg", content_type: "image/jpg")
artist_john.save
artist_eric = Artist.new({ user: eric, bio: "Bio of Artist 2", name: "Artist 2", address: "rue de la république, nantes", phone_number: "123-456-7891"})
artist_eric.photos.attach(io: URI.open(photo_artist), filename: "dubinc.jpg", content_type: "image/jpg")
artist_eric.save
artist_sarah = Artist.new({ user: sarah, bio: "Bio of Artist 3", name: "Artist 3", address: "rue de vern, rennes", phone_number: "123-456-7892"})
artist_sarah.photos.attach(io: URI.open(photo_artist), filename: "dubinc.jpg", content_type: "image/jpg")
artist_sarah.save
artist_marc = Artist.new({ user: marc, bio: "Bio of Artist 4", name: "Artist 4", address: "rue de rennes, nantes", phone_number: "123-456-7893"})
artist_marc.photos.attach(io: URI.open(photo_artist), filename: "dubinc.jpg", content_type: "image/jpg")
artist_marc.save
artist_nina = Artist.new({ user: nina, bio: "Bio of Artist 5", name: "Artist 5", address: "rue de paris, nantes", phone_number: "123-456-7894"})
artist_nina.photos.attach(io: URI.open(photo_artist), filename: "dubinc.jpg", content_type: "image/jpg")
artist_nina.save
puts "created #{Artist.count} artists"

photo_stage = "https://media.istockphoto.com/id/1358034815/fr/photo/conception-de-sc%C3%A8ne-vide-pour-la-maquette-et-lidentit%C3%A9-dentreprise-%C3%A9l%C3%A9ments-display.jpg?s=612x612&w=0&k=20&c=Xqg4xKgveuf36Onmv3pYErkWuls6KRky87xEeGDxv9M="
# seed stage
puts "create stage"
stage_tony = Stage.new({ user: tony, name: "Stage 1", description: "Description stage 1", address: "14 Rue de la potonnerie, 44000 Nantes", phone_number: "123-456-7890" })
stage_tony.photos.attach(io: URI.open(photo_stage), filename: "dubinc.jpg", content_type: "image/jpg")
stage_tony.save
stage_erika = Stage.new({ user: erika, name: "Stage 2", description: "Description stage 2", address: "22 boulevard michelet, 44100 Nantes", phone_number: "123-456-7890" })
stage_erika.photos.attach(io: URI.open(photo_stage), filename: "dubinc.jpg", content_type: "image/jpg")
stage_erika.save
stage_tom = Stage.new({ user: tom, name: "Stage 3", description: "Description stage 3", address: "1 rue jacquelin, 44200 Nantes", phone_number: "123-456-7890" })
stage_tom.photos.attach(io: URI.open(photo_stage), filename: "dubinc.jpg", content_type: "image/jpg")
stage_tom.save
stage_isa = Stage.new({ user: isa, name: "Stage 4", description: "Description stage 4", address: "7 avenue de Chaville, 44300 Nantes", phone_number: "123-456-7890" })
stage_isa.photos.attach(io: URI.open(photo_stage), filename: "dubinc.jpg", content_type: "image/jpg")
stage_isa.save
stage_kelly = Stage.new({ user: kelly, name: "Stage 5", description: "Description stage 5", address: "1 rue du stade, 44400 Nantes", phone_number: "123-456-7890" })
stage_kelly.photos.attach(io: URI.open(photo_stage), filename: "dubinc.jpg", content_type: "image/jpg")
stage_kelly.save
puts "created #{Stage.count} stages"

# seed booking
puts "create bookings"
booking_1 = Booking.create!({ status: 'confirmed', artist: artist_john, stage: stage_isa, date_start: Time.now, date_end: Time.now, rating_value: 3 })
booking_2 = Booking.create!({ status: 'confirmed', artist: artist_eric, stage: stage_erika, date_start: Time.now, date_end: Time.now, rating_value: 4 })
booking_3 = Booking.create!({ status: 'confirmed', artist: artist_sarah, stage: stage_isa, date_start: Time.now, date_end: Time.now, rating_value: 5 })
puts "created #{Booking.count} bookings"

# seed ads
puts "create ads"
ads_1 = ArtistAd.new({ content: "Annonce 1", artist: artist_john })
ads_1.photo.attach(io: URI.open(photo_artist), filename: "dubinc.jpg", content_type: "image/jpg")
ads_1.save
ads_2 = StageAd.create!({ content: "Annonce 2", stage: stage_erika })
ads_2.photo.attach(io: URI.open(photo_stage), filename: "dubinc.jpg", content_type: "image/jpg")
ads_2.save
ads_3 = ArtistAd.create!({ content: "Annonce 3", artist: artist_sarah })
ads_3.photo.attach(io: URI.open(photo_artist), filename: "dubinc.jpg", content_type: "image/jpg")
ads_3.save
puts "created #{ArtistAd.count} & #{StageAd.count} ads"
