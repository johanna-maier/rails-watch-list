# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb
require 'json'
require 'open-uri'

puts 'Destroying previous bookmarks, lists, movies (in this order)'
Bookmark.delete_all
List.delete_all
Movie.delete_all

puts 'Fetching LeWagon API for top 20 movies'

top_rated_movies_url = 'https://tmdb.lewagon.com/movie/top_rated'

response = URI.open(top_rated_movies_url).read
data = JSON.parse(response)

puts 'Creating new movie instance for each result'

data['results'].each do |result|
  title = result['title']
  overview = result['overview']
  rating = result['vote_average']
  poster_url = "https://image.tmdb.org/t/p/original#{result['poster_path']}"
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

puts 'Seeded movies'

puts 'Creating a basic selection of lists'
selection = ['Classic Movies', 'Romantic Movies', 'Action Movies', 'Western Movies', 'Children Movies', 'Animal Movies', 'Top 10']

selection.each do |list_title|
  List.create(name: list_title)
end

puts 'Seeded lists'

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
