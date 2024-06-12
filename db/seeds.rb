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
john = User.create!(email: "john@example.com", password: "secret")
eric = User.create!(email: "eric@example.com", password: "secret")
sarah = User.create!(email: "sarah@example.com", password: "secret")
marc = User.create!(email: "marc@example.com", password: "secret")
nina = User.create!(email: "nina@example.com", password: "secret")
tony = User.create!(email: "tony@example.com", password: "secret")
erika = User.create!(email: "erika@example.com", password: "secret")
tom = User.create!(email: "tom@example.com", password: "secret")
isa = User.create!(email: "misaarc@example.com", password: "secret")
kelly = User.create!(email: "kelly@example.com", password: "secret")
# nouveaux users
renaud = User.create!(email: "renaud@example.com", password: "secret")
amanda = User.create!(email: "amanda@example.com", password: "secret")
yoann = User.create!(email: "yoann@example.com", password: "secret")
vianney = User.create!(email: "vianney@example.com", password: "secret")
pascal = User.create!(email: "pascal@example.com", password: "secret")
puts "created #{User.count} users"

# seed artist
puts "create artist"
c2c_photos = [
  "https://img.nrj.fr/rY4FoH5JIEtVoMHJ87F7Btf1cjg=/http%3A%2F%2Fmedia.nrj.fr%2F436x327%2F2012%2F11%2Fc2c_7953.jpg",
  "https://www.tsugi.fr/2023/wp-content/uploads/2023/01/capture-decran-2023-01-30-a-153118.png",
  "https://images.equipboard.com/uploads/user/image/4163/big_c2c.jpg?v=1714663883",
  "https://magazinediscothequeleblog.files.wordpress.com/2014/04/gallery-07.jpg"
]

ultra_vomit_photos = [
  "https://www.mplusinfo.fr/wp-content/uploads/2017/03/ultravomit.png",
  "https://lecargo.fr/wp-content/uploads/2023/11/ultravomit2023raclettebycharlotte-gonzalez-scaled-e1701430145101-1500x845.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/78/Hellfest2019UltraVomit_01.jpg/800px-Hellfest2019UltraVomit_01.jpg",
  "https://www.unitedrocknations.com/reportages/ultra-vomit-report-ultra-vomit-@-hellfest-2017--917.jpg"

]
katerine_photos = [
  "https://www.francebleu.fr/s3/cruiser-production/2023/05/70690e4d-0dc3-44ea-88a4-ab4c284b744d/1200x680_sc_84643-ifln1noc14-whr.jpg",
  "https://diveng.rosselcdn.net/sites/default/files/dpistyles/diverto_16_9_749w/node_420/1368/public/thumbnails/image/abaca_720281_059.jpg?itok=pUSpJgnm1674022008",
  "https://www.radiofrance.fr/s3/cruiser-production/2019/11/82be232c-68f2-49cd-8dc8-b82f45ef967b/870x489_gettyimages-134369668.jpg",
  "https://images.nrpyrenees.fr/api/v1/images/view/5bf6bcef8fe56f76a0530c6e/large/image.jpg"
]
von_pariahs_photos = [
  "https://france3-regions.francetvinfo.fr/image/AJLHnfTh9u7Qb_KB3U9W9jVcEp4/1200x675/regions/2020/06/09/5edef8e42fe7f_vonpariahs_presse_2016_01_color_greggbrehin1.jpg",
  "https://loreillequigratte.com/wp-content/uploads/2019/12/von-pariahs.jpg",
  "https://imfromrennes.com/wp-content/uploads/2024/01/Presspics-1024x686-1.jpg",
  "https://cdn-s-www.leprogres.fr/images/079F504A-CF06-44FC-9E67-FD9AB2563B73/NW_raw/au-milieu-de-nulle-part-mais-solidement-campes-sur-des-bases-rock-von-pariahs-photo-dr-1459884139.jpg"
]
ko_ko_mo_photos = [
  "https://upload.wikimedia.org/wikipedia/commons/d/d4/NDLE2023KoKoMo_01.jpg",
  "https://www.stereolux.org/sites/default/files/styles/auto_1920/public/ged/carrekokomo_0.jpg?itok=okCKDsGe",
  "https://france3-regions.francetvinfo.fr/image/8XBEb8aQa-uByvieKDL9UsyJWVI/4032x3024/regions/2022/03/23/623b34c991114_img-6459-2.jpg",
  "https://static.actu.fr/uploads/2019/10/25260-191024181121912-0-960x640.jpg"
]

artist_john = Artist.new({ user: john, bio: "Électro, Hip-Hop. C2C est un groupe de DJs nantais renommé pour ses performances de turntablism et ses morceaux électro-hip-hop innovants.", name: "C2C", address: "1 rue Massenet, 44000 NANTES", phone_number: "123-456-7890"})
c2c_photos.each do |photo|
  artist_john.photos.attach(io: URI.open(photo), filename: "c2c.jpg", content_type: "image/jpg")
end
artist_john.save

artist_eric = Artist.new({ user: eric, bio: "Metal Parodique. Ultra Vomit est connu pour ses parodies humoristiques de chansons metal et rock, avec des performances énergétiques et décalées.", name: "Ultra Vomit", address: "1 rue de Lorraine, 44000 NANTES", phone_number: "123-456-7891"})
ultra_vomit_photos.each do |photo|
  artist_eric.photos.attach(io: URI.open(photo), filename: "ultravomit.jpg", content_type: "image/jpg")
end
artist_eric.save

artist_sarah = Artist.new({ user: sarah, bio: "Pop, Chanson Française. Philippe Katerine est un chanteur et auteur-compositeur nantais célèbre pour ses chansons excentriques et poétiques, qui oscillent entre pop et chanson française.", name: "Katerine", address: "3 rue des Forges, 44000 NANTES", phone_number: "123-456-7892"})
katerine_photos.each do |photo|
  artist_sarah.photos.attach(io: URI.open(photo), filename: "katerine.jpg", content_type: "image/jpg")
end
artist_sarah.save

artist_marc = Artist.new({ user: marc, bio: "Rock, Post-Punk. Von Pariahs est un groupe de rock nantais influencé par le post-punk des années 80, avec un son énergique et des textes puissants.", name: "Von Pariahs", address: "3 rue de la Ruette, 44000 NANTES", phone_number: "123-456-7893"})
von_pariahs_photos.each do |photo|
  artist_marc.photos.attach(io: URI.open(photo), filename: "vonpariahs.jpg", content_type: "image/jpg")
end
artist_marc.save

artist_nina = Artist.new({ user: nina, bio: "Rock, Blues. Ko Ko Mo est un duo nantais qui mélange rock et blues avec une énergie débordante, marqué par des performances scéniques impressionnantes et une guitare virtuose.", name: "Ko Ko Mo", address: "2 rue Emile Zola, 44000 NANTES", phone_number: "123-456-7894"})
ko_ko_mo_photos.each do |photo|
  artist_nina.photos.attach(io: URI.open(photo), filename: "kokomo.jpg", content_type: "image/jpg")
end
artist_nina.save
puts "created #{Artist.count} artists"

# seed stage
puts "create stage"
le_ferrailleur_photos = [
  "https://lh3.googleusercontent.com/p/AF1QipNjzNK79fI8-N_YfM1tFzPBKc9QdzUQ3xVPPvmT=s1360-w1360-h1020",
  "https://www.bigcitylife.fr/wp-content/uploads/2019/05/conferences-ferrailleur.jpg",
  "https://www.francebleu.fr/s3/cruiser-production/2022/05/e7a34295-c046-44b6-98a0-11266ff81d36/1200x680_bf2a5175.jpg",
  "https://media.ouest-france.fr/v1/pictures/MjAyMjA1ZWNiZjRkZWExNGU1OTJjODA1ZjE0YzIwZDllYmZjZGE?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=0726da2d753601be1861229d1fd6fd57a57407b308a9247bcc49dec10880aade"
]
le_nid_photos = [
  "https://lh3.googleusercontent.com/p/AF1QipMOu6MvQ6lhoisER6S3I1B86AOwP2D_0zGvrfis=s1600-w640",
  "https://media.abcsalles.com/images/1/salles/900h/4828/le-nid-3.jpg",
  "https://images.lesindesradios.fr/filters:format(webp)/radios/alouette/importrk/news/original/5ebd10ebbbf1d8.46605889.jpg",
  "https://media-cdn.tripadvisor.com/media/photo-s/18/48/65/55/concert-at-le-nid.jpg"
]
le_chien_stupide_photos = [
  "https://images.schlouk-map.com/cache/gallery/uploads/images/places/le-chien-stupide-62583db415e1f3.88508420.png",
  "https://lh3.googleusercontent.com/p/AF1QipOmSm2V4PbdyAiWuzmLZn4UQT6xzlVO3b-_yk2o=s1600-w640",
  "https://lh3.googleusercontent.com/p/AF1QipNBagYNvppSU15Z6EP3voXq6v9qYSB7Npo_GLGz=s1600-w640",
  "https://lh3.googleusercontent.com/p/AF1QipOZIgY3AMLs9NriUjNmcVv9I-i_x7XQrEItDJTP=s1600-w640"
]
le_chat_noir_photos = [
  "https://static.actu.fr/uploads/2023/02/bar-le-chat-noir-nantes.jpg",
  "https://www.wik-nantes.fr/sites/default/files/styles/img_principale_contenu_interne/public/bar/auchatnoir_2.jpg?itok=ADLM8fR8",
  "https://cdn.eat-list.fr/establishment/photo/gallery_photo/44000-nantes/le-chat-noir_157276_05c.jpg",
  "https://media-cdn.tripadvisor.com/media/photo-m/1280/19/3c/cc/1e/le-cafe-tout-vide.jpg"
]
le_live_bar_photos = [
  "https://unfuretdanslaville.files.wordpress.com/2014/01/nantes-live-bar.jpg",
  "https://privateaser-media.s3.eu-west-1.amazonaws.com/etab_photos/2853/1500x750/365855.jpg",
  "https://privateaser-media.s3.eu-west-1.amazonaws.com/etab_photos/2853/1500x750/365856.jpg",
  "https://media.ouest-france.fr/v1/pictures/MjAxNjAxODZlNzMzMzgwM2I0NDQzMTEzNzA3MmE3ZDA0OTc2MzM?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=edafd945e70961b6572e0dbff6ca2ef230004017342c4aa400c7a1f5a63b4868"
]
les_berthoms_photos = [
  "https://cdn.prod.website-files.com/6389b7b6b699a6212ce2b12c/6409920a60b4128eedf5ab92_323587765_1123010798371492_331963757301009390_n.jpeg",
  "https://cdn.prod.website-files.com/6389b7b6b699a6212ce2b12c/63bc0901b5c5238a8b2c076e_Berthom%20Nantes.jpeg",
  "https://maison-g.fr/wp-content/uploads/2018/03/P1106458-e1554880403392.jpg",
  "https://cdn.prod.website-files.com/6389b7b6b699a6212ce2b12c/63a5b91cb9432edbc4789f42_bar.bordeaux.1.jpeg"
]
le_delirium_photos = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKzUVYQGz7MHTKrhcWAmWZP2qX_CcCm5Ru2A&s",
  "https://www.wik-nantes.fr/sites/default/files/styles/img_principale_contenu_interne/public/bar/img_1973.jpg?itok=EirUEscl",
  "https://www.pagesjaunes.fr/media/agc/0e/31/86/00/00/32/1a/f6/1a/eb/5dd50e31860000321af61aeb/5dd50e31860000321af61aec.png",
  "https://www.wik-nantes.fr/sites/default/files/styles/img_principale_contenu_interne/public/bar/img_1972.jpg?itok=EA9HaG_Z"
]
le_ak_shelter_photos = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEKa6GuuY-8xqlmExMkJE5KP_zfwBizpWMew&s",
  "https://images.schlouk-map.com/cache/gallery/uploads/images/places/ak-shelter-6405b1452f5190.30889300.jpg",
  "https://media-cdn.tripadvisor.com/media/photo-s/1c/54/fc/4b/ak-shelter-352-boulevard.jpg",
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcReFwaLeOclgE4aurXkp4wBDi3yfUy02Wd_Fg&s"
]
john_mcbyrne_photos = [
  "https://www.pagesjaunes.fr/media/agc/24/a8/81/00/00/33/55/cf/37/72/5d3f24a88100003355cf3772/5d3f24a88100003355cf3773.jpg",
  "https://images.schlouk-map.com/cache/gallery/uploads/images/places/john-mcbyrne-625828cacff0f5.77375469.png",
  "https://privateaser-media.s3.eu-west-1.amazonaws.com/etab_photos/49808/original/402768.jpg",
  "https://lh3.googleusercontent.com/p/AF1QipPUBUb3LPepfNOW9noRGX60bcg1lVZQVxvMcNpF=s1600-w640"
]
le_labo_photos = [
  "https://www.cestpasnous.fr/wp-content/uploads/2016/12/labo_logo-min.jpg",
  "https://lh3.googleusercontent.com/p/AF1QipPZ78rMCfOs7L1-COAEHglATtQsTjf28OvjjgHO=s1600-w640",
  "https://privateaser-media.s3.eu-west-1.amazonaws.com/etab_photos/2858/1500x750/366749.jpg",
  "https://www.lelabo-nantes.com/wp-content/uploads/2024/03/terrasse-700x394.jpg"
]

stage_tony = Stage.new({ user: tony, name: "Le Ferrailleur", description: "Le Ferrailleur, est depuis maintenant plus de 15 ans une référence de la scène rock/metal française. Lieu dédié à la découverte et à la diversité au travers d’une programmation éclectique", address: "21 Quai des Antilles, 44200 NANTES", phone_number: "123-456-7890" })
le_ferrailleur_photos.each do |photo|
  stage_tony.photos.attach(io: URI.open(photo), filename: "leferrailleur.jpg", content_type: "image/jpg")
end
stage_tony.save

stage_erika = Stage.new({ user: erika, name: "Le Nid", description: "Une scène au 32è étage !", address: "Tour Bretagne, Place de Bretagne, 44000 NANTES", phone_number: "123-456-7890" })
le_nid_photos.each do |photo|
  stage_erika.photos.attach(io: URI.open(photo), filename: "lenid.jpg", content_type: "image/jpg")
end
stage_erika.save

stage_tom = Stage.new({ user: tom, name: "Le Chien Stupide", description: "Bar | Concerts | Dj Sets...", address: "4 Rue des Carmélites, 44000 NANTES", phone_number: "123-456-7890" })
le_chien_stupide_photos.each do |photo|
  stage_tom.photos.attach(io: URI.open(photo), filename: "lechienstupide.jpg", content_type: "image/jpg")
end
stage_tom.save

stage_isa = Stage.new({ user: isa, name: "Le Chat Noir", description: "Concerts, soirées slam-poésie, théâtre d'impro ou jeux dans un bar animé doté d'une estrade et d'une terrasse.", address: "13 Allée Duquesne, 44000 NANTES", phone_number: "06 61 68 66 20" })
le_chat_noir_photos.each do |photo|
  stage_isa.photos.attach(io: URI.open(photo), filename: "lechatnoir.jpg", content_type: "image/jpg")
end
stage_isa.save

stage_kelly = Stage.new({ user: kelly, name: "Le Live Bar", description: "Ce bar animé aux murs rouges, fresques colorées et sol en carrelage organise concerts et expositions.", address: "7 rue des Etats, 44000 NANTES", phone_number: "123-456-7890" })
le_live_bar_photos.each do |photo|
  stage_kelly.photos.attach(io: URI.open(photo), filename: "lelivebar.jpg", content_type: "image/jpg")
end
stage_kelly.save

# nouvelles scènes
stage_renaud = Stage.new({ user: renaud, name: "Les Berthoms", description: "L'équipe des Berthom Nantes vous reçoit tous les jours dans un endroit hyper accueillant rempli de bon gens pour prendre et donner du bon temps.", address: "1 bis cr Olivier de Clisson, 44000 NANTES", phone_number: "123-456-7890" })
le_live_bar_photos.each do |photo|
  stage_kelly.photos.attach(io: URI.open(photo), filename: "lesberthoms.jpg", content_type: "image/jpg")
end
stage_kelly.save

stage_amanda = Stage.new({ user: amanda, name: "Le Delirium café", description: "Carte simple, sélection de bières pression et soirées musicales ou sportives pour ce restaurant-bar convivial.", address: "19 allée Baco, 44000 NANTES", phone_number: "123-456-7890" })
le_live_bar_photos.each do |photo|
  stage_amanda.photos.attach(io: URI.open(photo), filename: "ledeliriumcafe.jpg", content_type: "image/jpg")
end
stage_amanda.save

stage_yoann = Stage.new({ user: yoann, name: "Le AK Shelter", description: "Un restaurant /bar a été aménagé autour d’un garage d’Harley Davidson.", address: "352 boulevard Marcel Paul, 44000 NANTES", phone_number: "123-456-7890" })
le_live_bar_photos.each do |photo|
  stage_yoann.photos.attach(io: URI.open(photo), filename: "leakshelter.jpg", content_type: "image/jpg")
end
stage_yoann.save

stage_vianney = Stage.new({ user: vianney, name: "John McByrne", description: "Pub Irlandais avec une ambiance de folie.", address: "21 rue des petites Ecuries, 44000 NANTES", phone_number: "123-456-7890" })
le_live_bar_photos.each do |photo|
  stage_vianney.photos.attach(io: URI.open(photo), filename: "johnmcbyrne.jpg", content_type: "image/jpg")
end
stage_vianney.save

stage_pascal = Stage.new({ user: pascal, name: "Le Labo", description: "Large carte de rhums du monde et cocktails créatifs dans un bar chaleureux et coloré, avec terrasse.", address: "19 rue Leon Blum, 44000 NANTES", phone_number: "123-456-7890" })
le_live_bar_photos.each do |photo|
  stage_pascal.photos.attach(io: URI.open(photo), filename: "lelabo.jpg", content_type: "image/jpg")
end
stage_pascal.save
puts "created #{Stage.count} stages"

# seed booking
puts "create bookings"
booking_1 = Booking.create!({ status: 'confirmed', artist: artist_john, stage: stage_isa, date_start: Time.now, date_end: Time.now, rating_value: 3 })
booking_2 = Booking.create!({ status: 'confirmed', artist: artist_eric, stage: stage_erika, date_start: Time.now, date_end: Time.now, rating_value: 4 })
booking_3 = Booking.create!({ status: 'confirmed', artist: artist_sarah, stage: stage_isa, date_start: Time.now, date_end: Time.now, rating_value: 5 })
puts "created #{Booking.count} bookings"

# seed ads
puts "create ads"
ads_1 = ArtistAd.new({ content: "Hey ! Nous sommes dispo samedi prochain !", artist: artist_john })
ads_1.photo.attach(io: URI.open("https://magazinediscothequeleblog.files.wordpress.com/2014/04/gallery-07.jpg"), filename: "dubinc.jpg", content_type: "image/jpg")
ads_1.save!
ads_2 = StageAd.new({ content: "Cherche 3 groupes en urgence !", stage: stage_erika })
ads_2.photo.attach(io: URI.open("https://lh3.googleusercontent.com/p/AF1QipMOu6MvQ6lhoisER6S3I1B86AOwP2D_0zGvrfis=s1600-w640"), filename: "dubinc.jpg", content_type: "image/jpg")
ads_2.save!
ads_3 = ArtistAd.new({ content: "J'adoooooore, trouver une scène rapidemeeeent", artist: artist_sarah })
ads_3.photo.attach(io: URI.open("https://www.francebleu.fr/s3/cruiser-production/2023/05/70690e4d-0dc3-44ea-88a4-ab4c284b744d/1200x680_sc_84643-ifln1noc14-whr.jpg"), filename: "dubinc.jpg", content_type: "image/jpg")
ads_3.save!
ads_4 = StageAd.new({ content: "Nous recherchons la nouvelle pépite Nantaise ! Contactez-nous.", stage: stage_tom })
ads_4.photo.attach(io: URI.open("https://images.schlouk-map.com/cache/gallery/uploads/images/places/le-chien-stupide-62583db415e1f3.88508420.png"), filename: "dubinc.jpg", content_type: "image/jpg")
ads_4.save!
ads_5 = ArtistAd.new({ content: "De la place pour 2 ? Ca tombe bien, on est 6 !", artist: artist_marc })
ads_5.photo.attach(io: URI.open("https://france3-regions.francetvinfo.fr/image/AJLHnfTh9u7Qb_KB3U9W9jVcEp4/1200x675/regions/2020/06/09/5edef8e42fe7f_vonpariahs_presse_2016_01_color_greggbrehin1.jpg"), filename: "dubinc.jpg", content_type: "image/jpg")
ads_5.save!
ads_6 = StageAd.new({ content: "Petite scène mais grands fêtards, nous cherchons petits musicines mais grande guitare.", stage: stage_kelly })
ads_6.photo.attach(io: URI.open("https://unfuretdanslaville.files.wordpress.com/2014/01/nantes-live-bar.jpg"), filename: "dubinc.jpg", content_type: "image/jpg")
ads_6.save!
puts "created #{ArtistAd.count} & #{StageAd.count} ads"

# seed conversations
puts "create conversations"
conversation_1 = Conversation.create!(name: "conv-1")
conversation_2 = Conversation.create!(name: "conv-2")
conversation_3 = Conversation.create!(name: "conv-3")
puts "created #{Conversation.count} conversations"

# seed messages
puts "create messages"
message_1 = Message.create!(content: "Lorem ipsum dolor sit amet", sender: john, receiver: erika, conversation: conversation_1)
message_2 = Message.create!(content: "consectetur adipiscing elit, sed do eiusmod tempor incididunt", sender: erika, receiver: john, conversation: conversation_1)
message_3 = Message.create!(content: "Ut enim ad minim veniam, quis nostrud", sender: john, receiver: erika, conversation: conversation_1)
message_4 = Message.create!(content: "exercitation ullamco laboris nisi ut aliquip ex ea", sender: john, receiver: eric, conversation: conversation_2)
message_5 = Message.create!(content: "cillum dolore eu fugiat nulla pariatur.", sender: eric, receiver: john, conversation: conversation_2)
message_6 = Message.create!(content: "qui dolorem ipsum quia dolor sit amet, consectetur", sender: nina, receiver: john, conversation: conversation_3)
puts "created #{Message.count} messages"
