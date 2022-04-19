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
def case_statement(choice)
  case choice
  when '1'
    puts '1'
  when '2'
    puts '2'
  when '3'
    puts '3'
  when '4'
    puts '4'
  when '5'
    puts '5'
  when '6'
    puts '6'
  when '7'
    puts '7'
  when '8'
    puts '8'
  when '9'
    puts '9'
  when '10'
    puts '10'
  when '11'
    puts '11'
  when '12'
    puts '12'
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
