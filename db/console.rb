require("pry")
require_relative("../models/artists")
require_relative("../moldels/album_collection")
AlbumCollection.delete_all()
Artist.delete_all()

#CREATE artist

artist1 = Artist.new({'name' => 'Michael Jacksn'})
artist1.save()
artist2 = Artist.new({'name' => 'Whitney Houston'})
artist2.save()
artist3 = Artist.new({'name' => 'Eagles'})
artist3.save()
artist4 = Artist.new({'name' => 'AC/DC'})
artist4.save()

# READ

all_artists = Artist.all()

# CRATE album_collection

album1 = AlbumCollection.new({
  'artist_id' => artist1.id,
  'title' => 'Thriller',
  'genre' => 'R&B'
  })

album1.save()

# returned_album = AlbumCollection.find(1)

album2 = AlbumCollection.new({
  'artist_id' => artist2.id,
  'title' => 'The Bodyguard',
  'genre' => 'R&B'
  })

  album2.save()

album3 = AlbumCollection.new({
  'artist_id' => artist3.id,
  'title' => 'Their Greatest Hits 1971 - 1975',
  'genre' => 'Rock'
  })

album3.save()

album4 = AlbumCollection.new({
  'artist_id' => artist4.id,
  'title' => 'Back in Black',
  'genre' => 'Hard Rock'
  })

album4.save()





binding.pry
nil
