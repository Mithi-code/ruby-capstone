require_relative './app_helpers'
require_relative 'associations'
require 'date'
class App
  include AppHelpers
  include Associations
  def initialize
    @books = []
    @games = []
    @authors = []
    @music_album = []
    @movies = []
    @genres = []
    @labels = []
    @sources = []
    load_data
  end

  def load_data
    load_list(@games, 'games', Game)
    load_list(@authors, 'authors', Author)
    load_list(@movies, 'movies', Movie)
    load_list(@sources, 'sources', Source)
    load_list(@labels, 'labels', Label)
    load_list(@books, 'books', Book)
    load_list(@music_album, 'music', MusicAlbum)
    load_list(@genres, 'genre', Genre)
  end

  def preserve_data
    preserve_list(@games, 'games')
    preserve_list(@authors, 'authors')
    preserve_list(@movies, 'movies')
    preserve_list(@sources, 'sources')
    preserve_list(@labels, 'labels')
    preserve_list(@books, 'books')
    preserve_list(@genres, 'genre')
    preserve_list(@music_album, 'music')
  end

  def list_books
    list_items @books
  end

  def list_games
    list_items @games
  end

  def list_authors
    @authors.each_with_index do |author, i|
      puts "#{i + 1}. #{author.first_name} #{author.last_name}"
    end
  end

  def list_music_albums
    list_items @music_album
  end

  def list_movies
    list_items @movies
  end

  def list_genres
    @genres.each_with_index do |genre, i|
      puts "#{i + 1}: #{genre.name}"
    end
  end

  def list_labels
    @labels.each_with_index do |label, i|
      print "#{i + 1}: #{label.title}. "
    end
  end

  def list_sources
    @sources.each_with_index do |source, i|
      puts "#{i + 1}: #{source.name}. "
    end
  end

  def add_book
    is_cover_state = yes_or_no 'Is it a bad book'
    publish_date = get_date 'Publish date '
    book = Book.new(cover_state: is_cover_state, publish_date: publish_date, publisher: '')
    add_association book
    @books << book
  end

  def add_movie
    is_silent = yes_or_no 'Is it a silent movie'
    publish_date = get_date 'Publish date '
    movie = Movie.new(silent: is_silent, publish_date: publish_date)
    add_association movie
    @movies << movie
  end

  def add_music_album
    publish_date = get_date 'publish date'
    on_spotify = yes_or_no 'Is it on spotify'
    print 'music album name: '
    name = gets.chomp
    music = MusicAlbum.new(
      publish_date: publish_date,
      on_spotify: on_spotify,
      name: name
    )
    add_association music
    @music_album << music
  end

  def add_game
    is_multiplayer = yes_or_no 'Is it a multiplayer game'
    publish_date = get_date 'Publish date '
    last_played_at = get_date 'Last_played_date'
    game = Game.new(
      multiplayer: is_multiplayer,
      publish_date: publish_date,
      last_played_at: last_played_at
    )
    add_association game
    @games << game
  end

  private

  def add_association(item)
    add_associate(label, @labels, item) { |label| item.add_label label }
    add_associate(author, @authors, item) { |author| item.add_author author }
    add_associate(source, @sources, item) { |source| item.add_source source }
    add_associate(genre, @genres, item) { |genre| item.add_genre genre }
  end

  def list_items(list)
    list.each_with_index do |item, i|
      puts %(#{i + 1}. #{item.label.title}
      Source: #{item.source.name}
      Author: #{item.author.first_name} #{item.author.last_name}
      Genre: #{item.genre.name}
      )
    end
  end
end
