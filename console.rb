require_relative( 'models/movie' )
require_relative( 'models/star' )
require_relative( 'models/casting' )

require( 'pry-byebug')
########################
Casting.delete_all()
Star.delete_all()
Movie.delete_all()
########################
movie1 = Movie.new({ 'title' => 'The Fellowship of the Ring', 'genre' => 'fantasy', 'rating' => '10'})
movie2 = Movie.new({ 'title' => 'The Two Towers', 'genre' => 'fantasy', 'rating' => '10'})
movie3 = Movie.new({ 'title' => 'Flipper', 'genre' => 'children', 'rating' => '7'})
movie4 = Movie.new({ 'title' => 'Armageddon', 'genre' => 'sci-fi', 'rating' => '8'})
movie1.save()
movie2.save()
movie3.save()
movie4.save()

########################
star1 = Star.new({ 'first_name' => 'Elijah', 'second_name' => 'Wood'})
star2 = Star.new({ 'first_name' => 'Liv', 'second_name' => 'Tyler'})
star1.save
star2.save
#######################
casting1 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star1.id, 'fee' => '100'})
casting2 = Casting.new({ 'movie_id' => movie1.id, 'star_id' => star2.id, 'fee' => '100'})
casting3 = Casting.new({ 'movie_id' => movie2.id, 'star_id' => star1.id, 'fee' => '100'})
casting4 = Casting.new({ 'movie_id' => movie2.id, 'star_id' => star2.id, 'fee' => '100'})
casting5 = Casting.new({ 'movie_id' => movie3.id, 'star_id' => star1.id, 'fee' => '100'})
casting6 = Casting.new({ 'movie_id' => movie4.id, 'star_id' => star2.id, 'fee' => '100'})
casting1.save()
casting2.save()
casting3.save()
casting4.save()
casting5.save()
casting6.save()
#######################


# p movie1.contains_stars()
# p movie3.contains_stars()
p star1.which_movies_is_this_star_in()
