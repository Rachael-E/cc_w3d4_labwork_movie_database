require_relative("../db/sql_runner")
require_relative("./movie")

class Star

  attr_reader :id, :first_name, :last_name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
  end

  def save()
    sql = "INSERT INTO stars
    (first_name, second_name)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@first_name, @second_name]
    star = SqlRunner.run( sql, values).first
    @id = star['id'].to_i

  end

  def which_movies_is_this_star_in()
    sql = "SELECT movies.*
    FROM movies
    INNER JOIN castings
    ON castings.movie_id = movies.id
    WHERE star_id = $1"
    values = [@id]
    movies_data = SqlRunner.run(sql, values)
    return Movie.map_items(movies_data)

  end

  def self.map_items(star_data)
    result = star_data.map { |star| Star.new( star ) }
    return result

  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end





end
