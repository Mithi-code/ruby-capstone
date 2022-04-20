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
  end

  def list_books; end

  def list_games
    list_items @games
  end

  def list_authors
    @authors.each_with_index do |author, i|
      print "#{i + 1}. #{author.first_name} #{author.last_name}, "
      author.items.each_with_index { |item, _i| puts "authored #{item.label.title}" }
    end
  end

  def list_music_albums; end

  def list_movies; end

  def list_genres
    @gemers.each_with_index do |genres, i|
      print "#{i + 1": #{genre.name}"
  end

  def list_labels; end

  def list_sources; end

  def add_book; end

  def add_movie; end

  def add_music_album; 
    publish_date = get_date 'publish date'
    on_spotify = yes_or_no 'Is it on spotify'
    music = MusicAlbum.new(
      publish_date = publish_date,
      on_spotify = on_spotify
    )
    add_associate music
    @musics << music
  end

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
