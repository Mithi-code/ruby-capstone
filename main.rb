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

def main
  choice = nil
  until choice == '13'
    choice = choose
    puts "You choose #{choice}"
    case @choice
    when '1'

      puts choice
    when '2'
      @app.list_people
      puts
    when '3'

      puts choice
      puts
    when '4'

      puts choice
      puts
    when '5'

      puts choice
      puts
    when '6'

      puts choice
      puts
    when '7'

      puts choice
      puts
    when '8'

      puts choice
      puts
    when '9'

      puts choice
      puts
    when '10'

      puts choice
      puts
    when '11'

      puts choice
      puts
    when '12'

      puts choice
      puts
    end
  end
end

main
