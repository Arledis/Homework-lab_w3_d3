require('pg')
require_relative('../db/sql_runner')

class Artist
  attr_reader :id, :name
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end
  # Search
    def album_collections()
      sql = "SELECT * FROM album_collections WHERE artist_id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      albums = result.map { |album| AlbumCollection(album) }
      return albums
    end


# Save
  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    id_string = result[0]['id']
    @id = id_string.to_i
  end

  def update()
    sql = "
    UPDATE artists SET (
      name
      ) =
      (
        $1
        ) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

# Delete
  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql) # running the whole TABLE
    return artists.map { |person| Artist.new(person) } # maping all persons in the array options
  end



end
