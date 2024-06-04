  # This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'destroy data'
Booking.destroy_all
Artist.destroy_all
Stage.destroy_all
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

# seed artist
puts "create artist"
artist_john = Artist.create!({ user: john, bio: "Bio of Artist 1", name: "Artist 1", address: "123 Main St, City 1", phone_number: "123-456-7890"})
artist_eric = Artist.create!({ user: eric, bio: "Bio of Artist 2", name: "Artist 2", address: "124 Main St, City 1", phone_number: "123-456-7891"})
artist_sarah = Artist.create!({ user: sarah, bio: "Bio of Artist 3", name: "Artist 3", address: "125 Main St, City 1", phone_number: "123-456-7892"})
artist_marc = Artist.create!({ user: marc, bio: "Bio of Artist 4", name: "Artist 4", address: "126 Main St, City 1", phone_number: "123-456-7893"})
artist_nina = Artist.create!({ user: nina, bio: "Bio of Artist 5", name: "Artist 5", address: "127 Main St, City 1", phone_number: "123-456-7894"})
puts "created #{Artist.count} artists"

# seed stage
puts "create stage"
stage_tony = Stage.create!({ user: tony, name: "Stage 1", description: "Description stage 1", address: "14 Rue de la Fictive, 44000 Nantes", phone_number: "123-456-7890" })
stage_erika = Stage.create!({ user: erika, name: "Stage 2", description: "Description stage 2", address: "22 Avenue de l’Imaginaire, 44100 Nantes", phone_number: "123-456-7890" })
stage_tom = Stage.create!({ user: tom, name: "Stage 3", description: "Description stage 3", address: "3 Boulevard des Créateurs, 44200 Nantes", phone_number: "123-456-7890" })
stage_isa = Stage.create!({ user: isa, name: "Stage 4", description: "Description stage 4", address: "7 Place du Virtuel, 44300 Nantes", phone_number: "123-456-7890" })
stage_kelly = Stage.create!({ user: kelly, name: "Stage 5", description: "Description stage 5", address: "11 Allée des Innovateurs, 44400 Nantes", phone_number: "123-456-7890" })
puts "created #{Stage.count} stages"

# seed booking
puts "create bookings"
booking_1 = Booking.create!({ status: 'confirmed', artist: artist_john, stage: stage_isa, date_start: Time.now, date_end: Time.now, rating_value: 3 })
booking_2 = Booking.create!({ status: 'confirmed', artist: artist_eric, stage: stage_erika, date_start: Time.now, date_end: Time.now, rating_value: 4 })
booking_3 = Booking.create!({ status: 'confirmed', artist: artist_sarah, stage: stage_isa, date_start: Time.now, date_end: Time.now, rating_value: 5 })
puts "created #{Booking.count} bookings"
