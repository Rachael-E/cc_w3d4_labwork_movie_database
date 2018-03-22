require_relative("../db/sql_runner")
require_relative("./star")
require('pry')

class Movie

  attr_reader :id, :title, :genre
  attr_accessor :rating

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @rating = options['rating']
  end

  def save()
    # binding.pry
    # nil
    sql = "INSERT INTO movies
    (title, genre, rating)
    VALUES
    ($1,$2,$3)
    RETURNING id"
    values = [@title, @genre, @rating]
    movie = SqlRunner.run( sql, values ).first
    @id = movie['id'].to_i

  end

  def contains_stars()
    # binding.pry
    # nil
    sql = "SELECT stars.*
    FROM stars
    INNER JOIN castings
    ON castings.star_id = stars.id
    WHERE movie_id = $1"
    values = [@id]
    stars_data = SqlRunner.run(sql, values)
    # return stars_data.map {|star| Star.new( star )}
    return Star.map_items(stars_data)

  end

  def self.map_items(movie_data)
    result = movie_data.map { |movie| Movie.new( movie ) }
    return result

  end



  def self.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

end
