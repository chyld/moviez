require 'pry'
require 'pg'
require 'httparty'
require 'json'

def menu
  puts `clear`
  puts '1 - Populate Data'
  puts '2 - Quit'
  print '--> '
  gets.chomp
end

def populate_database
  print "Movie Title : "
  name = gets.chomp.gsub(' ', '+')
  url = "http://www.omdbapi.com/?t=#{name}"
  html = HTTParty.get(url).gsub("'", "")
  hash = JSON(html)
  sql = "insert into movies (title, year, rated, released, runtime, genre, director, writer, actors, plot, poster, imdbrating, imdbvotes, imdbid, response) values ('#{hash['Title']}', '#{hash['Year']}', '#{hash['Rated']}', '#{hash['Released']}', '#{hash['Runtime']}', '#{hash['Genre']}', '#{hash['Director']}', '#{hash['Writer']}', '#{hash['Actors']}', '#{hash['Plot']}', '#{hash['Poster']}', '#{hash['imdbRating']}', '#{hash['imdbVotes']}', '#{hash['imdbID']}', '#{hash['Response']}')"

  conn = PG.connect(:dbname =>'moviez', :host => 'localhost')
  conn.exec(sql)
  conn.close
end
