require('pg')
require_relative('../models/artists')


class AlbumCollection
  attr_accessor :title, :genre, :artist_id
  attr_reader :id

  def initialize(options)
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
  end

  # Search
    def artist()
      sql = "SELECT * FROM artist WHERE id = $1"
      values = [@artist_id]
      results = SqlRunner.run(sql, values)
      return Artist.new(results[0]) # maping could be use but struggles if you messing around.
    end

# Save
  def save()
    sql = "INSERT INTO album_collections
    (
      title,
      genre,
      artist_id
      ) VALUES
      (
        $1, $2, $3
        )
        RETURNING id"
        values = [@title, @genre, @artist_id]
        @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

# Update / Edit
  def update()
    sql = "
    UPDATE album_collections SET (
      title,
      genre,
      artist_id
      ) =
      (
        $1, $2, $3
        )
        WHERE id = $4" # why do I have to update the artist_id and not only the values?
        values = [@title, @genre, @artist_id, @id]
        SqlRunner.run(sql, values)
  end

# DELETE
  def delete()
    sql = "DELETE FROM album_collections WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

# finding artirt's album with artist's id as an argument
  def self.find(id)
    sql = "SELECT * FROM album_collections WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    album_hash = results[0]   # what this means?
    album = AlbumCollection.new(album_hash) # this will be displayed once finding the artist album
  end
    # DELETE all

    def self.delete_all()
      sql = "DELETE FROM album_collections"
      SqlRunner.run(sql)
    end

    # Reading all

    def self.all()
      sql = "SELECT * FROM album_collections"
      albums_hashes = SqlRunner.run(sql) # why set up a variable here? It should work without it, right?
      albums = albums_hashes.map { |album| AlbumCollection.new(album) }
    end


end
