require_relative './app_helpers'
require_relative 'game'
require_relative 'genre'
require_relative 'source'
require_relative 'label'
require_relative 'author'
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
    list_items @games
  end

  def list_authors
    @authors.each_with_index { |author, i| puts "#{i + 1}. #{author.first_name} #{author.last_name}" }
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
    add_association game
    @games << game
  end

  private

  def list_items(list)
    list.each_with_index do |item, i|
      puts %(#{i + 1}. #{item.label.title}
        Source: #{item.source.name}
        Author: #{item.author.first_name} #{item.author.last_name}
        Genre: #{item.genre.name}
      )
    end
  end

  def add_association(item)
    add_associate(label, @labels, item) { |label| item.add_label label }
    add_associate(author, @authors, item) { |author| item.add_author author }
    add_associate(source, @sources, item) { |source| item.add_source source }
    add_associate(genre, @genres, item) { |genre| item.add_genre genre }
  end

  def add_associate(associate, list, item)
    associate.add_item item
    yield associate
    list << associate
  end

  def label
    puts 'Lets add the Label'
    print 'title: '
    title = gets.chomp
    print 'color: '
    color = gets.chomp
    Label.new(title: title, color: color)
  end

  def source
    puts 'Lets add the Source'
    print 'Source name: '
    name = gets.chomp
    Source.new(name: name)
  end

  def genre
    puts 'Lets add the Genre'
    print 'Genre name: '
    name = gets.chomp
    Genre.new(name: name)
  end

  def author
    puts "Let's add the Author"
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    Author.new(first_name: first_name, last_name: last_name)
  end
end
