require_relative './classes/app.rb'
def choose
  puts
  puts %(Welcome to the catalog menu

Please choose an option by entering a number:

1 - List all books
2 - List all music albums
3 - List all games
4 - List all movies
5 - List all genres
6 - List all authors
7 - List all labels
8 - List all sources
9 - Add a book
10 - Add a movie
11 - Add a music album
12 - Add a game
13 - exit
    )
  gets.chomp.downcase
end

# rubocop:disable Metrics/MethodLength
def case_statement(choice, app)
  case choice
  when '1'
    app.list_books
  when '2'
    app.list_music_albums
  when '3'
    app.list_games
  when '4'
    app.list_movies
  when '5'
    app.list_genres
  when '6'
    app.list_authors
  when '7'
    app.list_labels
  when '8'
    app.list_sources
  when '9'
    app.add_book
  when '10'
    app.movie
  when '11'
    app.add_music_album

  when '12'
    app.add_game
  end
end

# rubocop:enable Metrics/MethodLength
def main
  choice = nil
  until choice == '13'
    choice = choose
    puts "You choose #{choice}"
    case_statement choice
  end
end

main
