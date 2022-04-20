require_relative './app_helpers'
require_relative 'game'
require_relative 'genre'
require_relative 'source'
require 'date'
class App
  include AppHelpers
  def initialize
    @books = []
    @games = []
    @authors = []
    @music_album = []
    @movies = []
    @genres = []
    @labels = []
    @sources = []
  end

  def list_books; end

  def list_games
    @games.each_with_index { |game, i| puts "#{i + 1}. #{game}" }
  end

  def list_authors
    @authors.each_with_index { |author, i| puts "#{i + 1}. #{author}" }
  end

  def list_music_albums; end

  def list_movies; end

  def list_genres; end

  def list_labels; end

  def list_sources; end

  def add_book; end

  def add_movie; end

  def add_music_album; end

  def add_game
    is_multiplayer = yes_or_no 'Is it a multiplayer game'
    published_date = get_date 'Publish date '
    last_played_at = get_date 'Last_played_date'
    game = Game.new(
      multiplayer: is_multiplayer,
      published_date: published_date,
      last_played_at: last_played_at
    )
    @games << game
  end

  private

  def add_source
    puts 'Lets add the Source'
    print 'Source name: '
    name = gets.chomp
    Source.new name
  end

  def add_genre
    puts 'Lets add the Genre'
    print 'Genre name: '
    name = gets.chomp
    Genre.new name
  end

  def add_author
    puts "Let's add the Author"
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    author = Author.new(
      first_name: first_name,
      last_name: last_name
    )
    @authors << author
  end
end
